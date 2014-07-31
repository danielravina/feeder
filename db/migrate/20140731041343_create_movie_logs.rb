class CreateMovieLogs < ActiveRecord::Migration
  def change
    create_table :movie_logs do |t|
      t.timestamps
    end
  end
end
