class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.belongs_to :user, index: true
      t.belongs_to :assessment_skill, index: true

      t.timestamps
    end
  end
end
