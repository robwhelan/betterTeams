class CreateUserDiscs < ActiveRecord::Migration
  def change
    create_table :user_discs do |t|
      t.belongs_to :user, index: true
      t.belongs_to :assessment_disc, index: true

      t.timestamps
    end
  end
end
