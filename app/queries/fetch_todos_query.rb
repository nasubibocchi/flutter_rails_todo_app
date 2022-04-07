class FetchTodosQuery
    # Mixin Query
    include Query

    def initialize()
    end

    def call
        todos = fetch_todos
        if todos.nil?
            todos = []
        end
        todo_list = ::TodoList.new(todos: todos)

        self.result = todo_list
    end

    private

        def fetch_todos
            ::Todo
            .order(updated_at: :desc)
        end
end
