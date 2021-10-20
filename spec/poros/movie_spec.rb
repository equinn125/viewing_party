require 'rails_helper'

describe Movie do
  it 'has attributes' do
    VCR.use_cassette('details_godfather_c') do
      @movie = MoviesFacade.details(238)

      expect(@movie.title).to eq("The Godfather")
      expect(@movie.id).to eq(238)
      expect(@movie.vote_average).to eq(8.7)
      expect(@movie.genres_translated).to eq(["Drama", "Crime"])
      expect(@movie.runtime).to eq(175)
      expect(@movie.overview).to eq("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
    end
  end

  it '#genres_translated' do

  end
end
