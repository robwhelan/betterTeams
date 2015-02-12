class CreateJobTasks < ActiveRecord::Migration
  def change
    create_table :job_tasks do |t|
      t.belongs_to :task_statement, index: true
      t.belongs_to :job_benchmark, index: true

      t.timestamps
    end
  end
end
