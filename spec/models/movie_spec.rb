require "spec_helper"

describe "MovieFeeder" do

  it "imports 10 upcoming box office blasters" do
    @movies = Movie.import_upcoming limit: 10

    @movies.count.should eq 10
    Movie.count.should eq 10

    @movies.each do |movie|
      Movie.exists?(title: movie.title).should be_true
    end
  end
end