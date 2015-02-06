class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.belongs_to :job_benchmark, index: true
      t.belongs_to :user, index: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
