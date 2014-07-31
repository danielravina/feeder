class Movie < ActiveRecord::Base

  validates_uniqueness_of :title

  class << self

    def import_upcoming (options = {})
      limit = options[:limit].present? ? options[:limit].to_i : 10
      result = []
      api_imports = RottenList.find(:type => "upcoming", :limit => limit , :expand_results => true)
      if api_imports.present?
        api_imports.each do |movie|
          result.push create get_movie_attrs(movie)
        end
      end
      MovieLog.create # FIXME - needs to be in a better place. leave it here for now
      result
    end

    def get_movie_attrs movie
      {
        title: movie.title,
        year: movie.year,
        runtime: movie.runtime,
        audience_score: movie.ratings.audience_score,
        synopsis: movie.synopsis,
        # mistake - should be release_date
        release_dates: movie.release_dates.theater,
        thumbnail: movie.posters.original
      }
    end

    def to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        find_each do |movie|
          csv << movie.attributes.values_at(*column_names)
        end
      end
    end
  end
end
