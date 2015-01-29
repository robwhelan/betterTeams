class CreateDiscAssessments < ActiveRecord::Migration
  def change
    create_table :disc_assessments do |t|
      t.belongs_to :user, index: true
      t.integer :driver_score
      t.integer :influencer_score
      t.integer :sociable_score
      t.integer :conscientious_score

      t.timestamps
    end
  end
end
