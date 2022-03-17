class FetchTodosQuery
    # Mixin Query
    include Query

    attr_reader :todos
    attr_accessor :todos

    validates :todos, presence: true

    def initialize(todos:)
        @todos = todos
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
