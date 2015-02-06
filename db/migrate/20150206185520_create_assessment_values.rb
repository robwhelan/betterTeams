class CreateAssessmentValues < ActiveRecord::Migration
  def change
    create_table :assessment_values do |t|
      t.string :name

      t.timestamps
    end
  end
end
