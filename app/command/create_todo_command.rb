class CreateTodoCommand
    include Command
    attr_reader :body, :is_done
    attr_accessor :todo

    validates :body, presence: true
    validates :is_done, presence: true

    def initialize(body:, is_done:)
        @body = body
        @is_done = is_done
    end

    def run
        todo = ::Todo.create_todo!(body: body, is_done: is_done)
        self.todo = todo
    end
end
