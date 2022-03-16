class UpdateTodoCommand
    include Command

    attr_reader :body, :isDone
    attr_accessor :todos

    validates :body, presence: true
    validates :isDone, presence: true

    def initialize(name:, isDone:)
        @body = body
        @isDone = isDone
    end

    def run
        todos.detail.update!(body: body, isDone: isDone)
        self.todos = todos
    end
end
