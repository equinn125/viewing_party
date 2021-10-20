require 'rails_helper'

RSpec.describe 'discover movies page' do
  before :each do
    @user = User.create(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')
    @party = @user.events.create(title: 'Harry Potter and The Chamber of Secrets', date: "2021-10-10", time: '8:00:00', runtime: 90, user_id: @user.id)
    @user_1 = User.create(email: 'test1@test.com', password: 'password1234', password_confirmation: 'password1234')
    @party_1 =  Event.create(title: 'Harry Potter and The Goblet of Fire', date: "2021-10-11", time: '9:00:00', runtime: 120, user_id: @user_1.id)
    @friendship = Friendship.create(follower_id:@user.id, followee_id:@user_1.id)
    @attendee =  Attendee.create(user_id:@user_1.id, event_id:@party.id)
    @attendee_1 = Attendee.create(user_id:@user.id, event_id:@party_1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit discover_path
  end

  it 'has a button to view top 40 movies' do
    VCR.use_cassette('top_40') do
      expect(page).to have_button('Discover Top 40 Movies')
      click_on 'Discover Top 40 Movies'
      expect(current_path).to eq(movies_path)
    end
  end

  it 'has a form to find movies by title' do
    VCR.use_cassette('movie_search') do
      expect(page).to have_field(:search)
      click_on("Search by Movie Title")
      expect(current_path).to eq(movies_path)
    end
  end

  it 'has a button to discover movies' do
    VCR.use_cassette('discover_movies') do
      expect(page).to have_button('Upcoming Movies')
      click_on('Upcoming Movies')
      expect(current_path).to eq(movies_path)
    end
  end

  it 'has a button to now playing movies' do
    VCR.use_cassette('now_playing') do
      expect(page).to have_button('Now Playing')
      click_on('Now Playing')
      expect(current_path).to eq(movies_path)
    end
  end
end
