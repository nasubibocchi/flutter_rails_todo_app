class CreateTodoCommand
    include Command
    attr_reader :body, :is_done
    attr_accessor :todo

    def initialize(body:, is_done:)
        @body = body
        @is_done = is_done
    end

    def run
        todo = ::Todo.create_todo!(body: body, is_done: is_done)
        self.todo = todo
    end
end
