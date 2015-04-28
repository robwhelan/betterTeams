class AddNamesToCommsSurvey < ActiveRecord::Migration
  def change
    add_column :comms_surveys, :first_name, :string
    add_column :comms_surveys, :last_name, :string
  end
end