class TodoListSerializer < ActiveModel::Serializer
  attributes :id
  has_many :todos, serializer: ::TodoSerializer
end
