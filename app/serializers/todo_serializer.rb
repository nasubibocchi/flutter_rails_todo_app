class TodoSerializer < ActiveModel::Serializer
  attributes :id, :body, :isDone
end
