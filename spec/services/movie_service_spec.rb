require 'rails_helper'

describe MoviesService do
  it 'can get all the top 40 movie data' do
    VCR.use_cassette('top_40_call') do
      response = MoviesService.top_40


      expect(response).to be_an Array
      expect(response[0]).to be_a Hash

      expect(response[0]).to have_key :original_title
      expect(response[0][:original_title]).to be_a String

      expect(response[0]).to have_key :title
      expect(response[0][:title]).to be_a String

      expect(response[0]).to have_key :release_date
      expect(response[0][:release_date]).to be_a String

      expect(response[0]).to have_key :vote_average
      expect(response[0][:vote_average]).to be_a Float
    end
  end

  it 'can get all of the movie data from a search' do
    VCR.use_cassette('movie_search_call') do
      response = MoviesService.movie_search("Holes")

      expect(response).to be_an Array
      expect(response[0]).to be_a Hash

      expect(response[0]).to have_key :original_title
      expect(response[0][:original_title]).to be_a String

      expect(response[0]).to have_key :title
      expect(response[0][:title]).to be_a String

      expect(response[0]).to have_key :release_date
      expect(response[0][:release_date]).to be_a String

      expect(response[0]).to have_key :vote_average
      expect(response[0][:vote_average]).to be_a Float
    end
  end

  it 'can get all the upcoming movie data' do
    VCR.use_cassette('upcoming_movie_call') do
      response = MoviesService.upcoming

      expect(response).to be_an Array
      expect(response[0]).to be_a Hash

      expect(response[0]).to have_key :original_title
      expect(response[0][:original_title]).to be_a String

      expect(response[0]).to have_key :title
      expect(response[0][:title]).to be_a String

      expect(response[0]).to have_key :release_date
      expect(response[0][:release_date]).to be_a String

    end
  end
  it 'can get all the upcoming movie data' do
    VCR.use_cassette('now_playing') do
      response = MoviesService.now_playing

      expect(response).to be_an Array
      expect(response[0]).to be_a Hash

      expect(response[0]).to have_key :original_title
      expect(response[0][:original_title]).to be_a String

      expect(response[0]).to have_key :title
      expect(response[0][:title]).to be_a String

      expect(response[0]).to have_key :release_date
      expect(response[0][:release_date]).to be_a String

    end
  end
end
