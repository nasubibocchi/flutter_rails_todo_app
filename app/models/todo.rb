class Todo < ApplicationRecord
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
