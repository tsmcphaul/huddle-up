class ChangeFinishedDefaultInTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :finished, :boolean, default: false
  end
end
