class AddReleaseDateToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :release_dates, :datetime
  end
end
