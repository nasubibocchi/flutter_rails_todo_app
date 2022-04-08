class TodoSerializer < ActiveModel::Serializer
  attributes :id, :body, :is_done
end
