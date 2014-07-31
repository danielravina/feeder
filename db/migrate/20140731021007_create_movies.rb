class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :runtime
      t.integer :audience_score
      t.text :synopsis

      t.timestamps
    end
  end
end
