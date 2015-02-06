class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.belongs_to :user, index: true
      t.belongs_to :job_posting, index: true

      t.timestamps
    end
  end
end
