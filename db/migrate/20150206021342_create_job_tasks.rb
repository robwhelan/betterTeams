class CreateJobTasks < ActiveRecord::Migration
  def change
    create_table :job_tasks do |t|
      t.string :name
      t.belongs_to :job_benchmark, index: true
      t.belongs_to :job_posting, index: true

      t.timestamps
    end
  end
end
