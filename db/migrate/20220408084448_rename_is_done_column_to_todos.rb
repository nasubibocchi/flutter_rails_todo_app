class RenameIsDoneColumnToTodos < ActiveRecord::Migration[7.0]
  def change
    rename_column :todos, :isDone, :is_done
  end
end
