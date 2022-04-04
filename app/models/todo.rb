class Todo < ApplicationRecord
  class << self
    def create_todo!(body:, isDone:)
      ActiveRecord::Base.transaction do
        Todo.create!(
          body: body,
          isDone: isDone,
        )
      end
    end
  end
end
