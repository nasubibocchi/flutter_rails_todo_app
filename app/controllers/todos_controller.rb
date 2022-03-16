class TodosController < ApplicationController
    def all
        query = ::FetchTodosQuery.call
        if query.success?
            render json: query.result, serializer: ::TodoListSerializer
        else
            render json: { error: {messages: query.errors.full_messages } }, status: bad_request
        end
    end

    def create
        command = ::CreateTodoCommand.run(
            body: safe_params[:body],
            isDone: safe_params[:isDone],
        )

        if command.success?
            render json: command.todo, selializer: ::TodoSerializer
        else
            render json: { error: {messages: command.errors.full_messages } }, status: bad_request
        end
    end

    def update
        command = ::UpdateTodoCommand.run(
            isDone: !(params[:isDone]&.presence),
        )
        if command.success?
            render json: command.todo, serializer: ::TodoSerializer
        else
            render json: { error: {messages: command.errors.full_messages } }, status: bad_request
        end
    end

    private

        def safe_params
            params.permit(:body, :isDone)
        end
end
