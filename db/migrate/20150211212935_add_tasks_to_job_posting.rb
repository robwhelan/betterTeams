class AddTasksToJobPosting < ActiveRecord::Migration
  def change
    add_column :job_postings, :task_01, :string
    add_column :job_postings, :task_02, :string
    add_column :job_postings, :task_03, :string
    add_column :job_postings, :task_04, :string
    add_column :job_postings, :task_05, :string
    add_column :job_postings, :task_06, :string
    add_column :job_postings, :task_07, :string
    add_column :job_postings, :task_08, :string
    add_column :job_postings, :task_09, :string
    add_column :job_postings, :task_10, :string
    add_column :job_postings, :task_11, :string
    add_column :job_postings, :task_12, :string
    add_column :job_postings, :task_13, :string
    add_column :job_postings, :task_14, :string
    add_column :job_postings, :task_15, :string
  end
end
