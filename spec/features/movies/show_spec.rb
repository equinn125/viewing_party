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
    @user = User.create(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')
    @user_1 = User.create(email: 'test1@test.com', password: 'password1234', password_confirmation: 'password1234')
    @friendship = Friendship.create(follower_id:@user.id, followee_id:@user_1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  it 'has a button to create a viewing party' do
    VCR.use_cassette('viewingparty-link') do
      @movie = MoviesFacade.details(238)

      visit "/movies/#{@movie.id}"
      expect(page).to have_link('Create Viewing Party')

      click_link 'Create Viewing Party'

      expect(current_path).to eq(new_event_path)

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
