class UpdateTodoCommand
    include Command

    attr_reader :body, :is_done
    attr_accessor :todos

    validates :body, presence: true
    validates :is_done, inclusion: { in: [true, false] }

    def initialize(name:, is_done:)
        @body = body
        @isDone = is_done
    end

    def run
        todos.detail.update!(body: body, isDone: is_done)
        self.todos = todos
    end
end
