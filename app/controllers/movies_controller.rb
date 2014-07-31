class MoviesController < ApplicationController

  before_filter :authorize_user

  def import
    @movies = Movie.import_upcoming limit: params[:limit]
    respond_to do |format|
      format.html { redirect_to :root, notice: "hello" }
    end
  end

  def index
    @movies = Movie.all.order("audience_score DESC")
    @last_import = MovieLog.last
    respond_to do |format|
      format.html
      format.csv { render text: @movies.to_csv  }
      format.pdf { render :pdf => "file_name" }
    end
  end

end