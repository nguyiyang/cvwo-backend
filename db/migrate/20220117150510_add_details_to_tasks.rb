class AddDetailsToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :priority, :integer
    add_column :tasks, :recurrence, :integer
  end
end
