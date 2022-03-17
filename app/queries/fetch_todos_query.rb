class FetchTodosQuery
    # Mixin Query module
    include Query

    # attr_reader :body, :isDone

    # validates :body, presence: true
    # validates :isDone, presence: true

    def initialize(body:, isDone:)
        @body = body
        @isDone = isDone
    end

    def call
        todos = fetch_todos
        todo_list = ::TodoList.new(todos: todos)

        self.result = todo_list
    end

    private

        def fetch_todos
            ::Todo.all
            # ::Todo.order(updated_at: :desc)
            # @result.order(updated_at: :desc)
        end
end
