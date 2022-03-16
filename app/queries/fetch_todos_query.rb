class FetchTodosQuery
    include Query

    attr_reader :body, :isDone

    validates :body, presence: true
    validates :isDone, presence: true

    def call
        todos = fetch_todos
        todo_list = ::TodoList.new(todos: todos)

        self.result = todo_list
    end

    private

        def fetch_todos
            ::Todo.includes(:body, :isDone).order(updated_at: :desc)
        end
end
