class TodosController < ApplicationController
    protect_from_forgery with: :null_session

    def create
        command = ::CreateTodoCommand.run(
            body: safe_params[:body],
            isDone: safe_params[:isDone],
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
            isDone: !(params[:isDone]&.presence),
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
            params.permit(:body, :isDone)
        end
end
