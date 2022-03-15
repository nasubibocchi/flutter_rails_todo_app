class TodoList
    include ActiveModel::Model
    include ActiveModel::Serialization
    attr_accessor :todos

    def initialize(todos: )
        @todos = todos
    end
end
