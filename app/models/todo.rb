class Todo < ApplicationRecord
  validates :body, presence: true
  validates :isDone, presence: true
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
