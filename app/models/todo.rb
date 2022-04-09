class Todo < ApplicationRecord
  validates :body, presence: true
  validates :is_done, inclusion: [true, false]

  class << self
    def create_todo!(body:, is_done:)
      ActiveRecord::Base.transaction do
        Todo.create!(
          body: body,
          is_done: is_done,
        )
      end
    end
  end
end
