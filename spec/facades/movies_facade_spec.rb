require 'rails_helper'

describe MoviesFacade do
  it '#top_40_movies returns movie objects' do
    VCR.use_cassette('top 40') do
      one_top_movie = MoviesFacade.top_40_movies.first

      expect(one_top_movie).to be_a Movie
      expect(one_top_movie.title).to eq('Dilwale Dulhania Le Jayenge')
    end
  end

  it '#search() returns movie objects' do
    VCR.use_cassette('search') do
      one_search_result = MoviesFacade.search('Holes').first

      expect(one_search_result).to be_a Movie
      expect(one_search_result.title).to eq('Holes')
    end
  end

  it '#discover_movies returns movie objects' do
    VCR.use_cassette('upcoming') do
      one_discover = MoviesFacade.upcoming.first
      expect(one_discover).to be_a Movie
      expect(one_discover.title).to eq("Venom: Let There Be Carnage")
    end
  end
  it '#now_playing returns movie objects' do
    VCR.use_cassette('playing') do
      one_discover = MoviesFacade.now_playing.first
      expect(one_discover).to be_a Movie
      expect(one_discover.title).to eq("Venom: Let There Be Carnage")
    end
  end
end
