class CreateAssessmentDiscs < ActiveRecord::Migration
  def change
    create_table :assessment_discs do |t|
      t.string :name

      t.timestamps
    end
  end
end
