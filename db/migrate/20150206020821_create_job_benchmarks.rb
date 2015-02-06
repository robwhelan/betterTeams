class CreateJobBenchmarks < ActiveRecord::Migration
  def change
    create_table :job_benchmarks do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
