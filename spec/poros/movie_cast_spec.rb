require 'rails_helper'

describe MovieCast do
  it 'has attributes' do
    VCR.use_cassette('cast_godfather') do
      @movie = MoviesFacade.cast(238)

      expect(@movie.cast.first[:name]).to eq("Marlon Brando")
      expect(@movie.cast.first[:character]).to eq("Don Vito Corleone")
    end
  end

  it '#first_10_cast_members' do

  end
end
