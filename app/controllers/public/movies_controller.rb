module Public
class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order("audience_score DESC")
    @last_import = MovieLog.last
    render "movies/index"
  end

end
end