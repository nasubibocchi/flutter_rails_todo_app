class UpdateTodoCommand
    include Command

    attr_reader :id, :body, :is_done
    attr_accessor :todo

    validates :id, presence: true
    validates :body, presence: true
    validates :is_done, inclusion: { in: [true, false] }

    def initialize(id:, body:, is_done:)
        @id = id
        @body = body
        @is_done = is_done

        @todo = ::Todo.find_by(id: id)
    end

    def run
        todo.update!(id: id, body: body, is_done: is_done)
        self.todo = todo
    end
end
