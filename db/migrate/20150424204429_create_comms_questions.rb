class CreateCommsQuestions < ActiveRecord::Migration
  def change
    create_table :comms_questions do |t|
      t.string :body
      t.belongs_to :assessment_disc, index: true

      t.timestamps
    end
  end
end
