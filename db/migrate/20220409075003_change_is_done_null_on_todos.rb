class ChangeIsDoneNullOnTodos < ActiveRecord::Migration[7.0]
  def change
    change_column_null :todos, :is_done, false
  end
end
