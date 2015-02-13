class CreateUserValues < ActiveRecord::Migration
  def change
    create_table :user_values do |t|
      t.belongs_to :user, index: true
      t.belongs_to :assessment_value, index: true

      t.timestamps
    end
  end
end
