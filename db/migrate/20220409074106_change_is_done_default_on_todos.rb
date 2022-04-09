class ChangeIsDoneDefaultOnTodos < ActiveRecord::Migration[7.0]
  def change
    change_column_default :todos, :is_done, from: true, to: false
  end
end
