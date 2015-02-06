class CreateJobSkills < ActiveRecord::Migration
  def change
    create_table :job_skills do |t|
      t.belongs_to :assessment_skill, index: true
      t.belongs_to :job_posting, index: true
      t.belongs_to :job_benchmark, index: true

      t.timestamps
    end
  end
end
