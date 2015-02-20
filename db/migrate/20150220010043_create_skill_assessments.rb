class CreateSkillAssessments < ActiveRecord::Migration
  def change
    create_table :skill_assessments do |t|
      t.belongs_to :user, index: true
      t.integer :analytical_problem_solving_score
      t.integer :conflict_management_score
      t.integer :continuous_learning_score
      t.integer :creativity_score
      t.integer :customer_service_score
      t.integer :decision_making_score
      t.integer :diplomacy_score
      t.integer :empathy_score
      t.integer :employee_development_score
      t.integer :flexibility_score
      t.integer :futuristic_thinking_score
      t.integer :goal_orientation_score
      t.integer :interpersonal_skills_score
      t.integer :leadership_score
      t.integer :management_score
      t.integer :negotiation_score
      t.integer :personal_effectiveness_score
      t.integer :persuasion_score
      t.integer :planning_score
      t.integer :presenting_score
      t.integer :self_management_score
      t.integer :teamwork_score
      t.integer :written_communication_score

      t.timestamps
    end
  end
end
