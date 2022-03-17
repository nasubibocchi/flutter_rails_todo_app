class FetchTodosQuery
    # Mixin Query
    include Query

    attr_reader :todos

    def initialize()
    end

    def call
        todos = fetch_todos
        todo_list = ::TodoList.new(todos: todos)

        self.result = todo_list
    end

    private

        def fetch_todos
            ::Todo.order(updated_at: :desc)
        end
end
