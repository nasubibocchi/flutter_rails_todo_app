class CreateTodoCommand
    include Command
    attr_reader :body, :isDone
    attr_accessor :todos

    validates :body, presence :true
    validates :isDone, presence :true

    def initialize(body:, isDone:)
        @body = body
        @isDone = isDone
    end

    def run
        todo = ::Todo.create_with_detail!(
            body: body,
            isDone: isDone,
        )
    end
end
