class CreateTodoCommand
    include Command
    attr_reader :body, :isDone
    attr_accessor :todo

    validates :body, presence: true
    validates :isDone, presence: true

    def initialize(body:, isDone:)
        @body = before_destroy
        @isDone = isDone
    end

    def run
        todo = ::Todo.create_todo!( body: body, isDone: isDone )
        self.todo = todo
    end
end
