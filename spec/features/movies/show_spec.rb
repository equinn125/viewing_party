require 'rails_helper'
RSpec.describe 'movie show page' do

#   As an authenticated user,
# When I visit the movie's detail page,
# I should see
#
#  Button to create a viewing party
# Details This button should take the authenticated user to the new event page
#
# And I should see the following information about the movie:
#
#  Movie Title
#  Vote Average of the movie
#  Runtime in hours & minutes
#  Genere(s) associated to movie
#  Summary description
#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information
  before :each do
  end
  it 'has a button to create a viewing party' do
    VCR.use_cassette('viewingparty-link') do
      @movie = MoviesFacade.details(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_link('Create Viewing Party')

      click_link 'Create Viewing Party'

      expect(current_path).to eq("/events/new")

    end
  end

  it 'displays the movie title' do
    VCR.use_cassette('viewingparty-details') do
      @movie = MoviesFacade.details(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_content(@movie.title)
    end
  end

  it 'displays the movie vote average' do
    VCR.use_cassette('viewingparty-details') do
      @movie = MoviesFacade.details(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_content(@movie.vote_average)
    end
  end

  it 'displays the movie runtime' do
    VCR.use_cassette('viewingparty-details') do
      @movie = MoviesFacade.details(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_content(@movie.runtime)
    end
  end

  it 'displays the movie genre(s)' do
    VCR.use_cassette('viewingparty-details') do
      @movie = MoviesFacade.details(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_content(@movie.genres_translated)
    end
  end

  it 'displays the movie overview' do
    VCR.use_cassette('viewingparty-details') do
      @movie = MoviesFacade.details(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_content(@movie.overview)
    end
  end

  it 'displays the movie cast members' do
    VCR.use_cassette('viewingparty-cast') do
      @movie = MoviesFacade.details(238)
      @movie_cast = MoviesFacade.cast(238)

      visit "/movies/#{@movie.id}"

      expect(page).to have_content(@movie_cast.first_10_cast_members.first[:name])
    end
  end

  it 'displays the movies total reviews' do
    VCR.use_cassette('viewingparty-reviews') do
      @movie = MoviesFacade.details(238)
      @movie_reviews = MoviesFacade.reviews(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_content(@movie_reviews.total_results)
    end
  end

  it 'displays the movie reviews authors and information' do
    VCR.use_cassette('viewingparty-reviews') do
      @movie = MoviesFacade.details(238)
      @movie_reviews = MoviesFacade.reviews(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_content(@movie_reviews.reviews.first[:author_details][:name])
      # expect(page).to have_content(@movie_reviews.reviews.first[:content])
    end
  end
end
