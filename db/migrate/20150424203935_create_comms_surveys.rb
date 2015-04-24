class CreateCommsSurveys < ActiveRecord::Migration
  def change
    create_table :comms_surveys do |t|
      t.belongs_to :improvement_plan, index: true
      t.string :name
      t.string :email
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
