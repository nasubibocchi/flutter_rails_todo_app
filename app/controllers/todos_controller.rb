class TodosController < ApplicationController
    def create
        command = ::CreateTodoCommand.run(
            body: safe_params[:body],
            is_done: ActiveRecord::Type::Boolean.new.cast(safe_params[:is_done]),
        )

        if command.success?
            render json: command.todo, serializer: ::TodoSerializer
        else
            render json: { error: { messages: command.errors.full_messages } }, status: :bad_request
        end
    end

    def index
        todos = ::Todo.all
        render json: todos, each_serializer: ::TodoSerializer
    end

    def show
        todo = ::Todo.find_by!(id: params[:id])
        render json: todo, serializer: ::TodoSerializer
    end

    def update
        command = ::UpdateTodoCommand.run(
            id: params[:id].presence,
            body: params[:body].presence,
            is_done: params[:is_done].presence,
        )
        if command.success?
            render json: command.todo, serializer: ::TodoSerializer
        else
            render json: { error: { messages: command.errors.full_messages } }, status: :bad_request
        end
    end

    def destroy
        todo = ::Todo.find_by!(id: params[:id])
        todo.destroy
        head :no_content
    end

    def all
        query = ::FetchTodosQuery.call()
        if query.success?
            render json: query.result, serializer: ::TodoListSerializer
        else
            render json: { error: { messages: query.errors.full_messages } }, status: :bad_request
        end
    end

    private

        def safe_params
            params.permit(:id, :body, :is_done)
        end
end
