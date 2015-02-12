class CreateTaskStatements < ActiveRecord::Migration
  def change
    create_table :task_statements do |t|
      t.string :onet_id
      t.string :body

      t.timestamps
    end
  end
end
