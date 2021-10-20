require 'rails_helper'

RSpec.describe 'create a new event' do
  before :each do
    @user = User.create(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')
    @party = @user.events.create(title: 'Harry Potter and The Chamber of Secrets', date: "2021-10-10", time: '8:00:00', runtime: 90, user_id: @user.id)
    @user_1 = User.create(email: 'test1@test.com', password: 'password1234', password_confirmation: 'password1234')
    @party_1 =  Event.create(title: 'Harry Potter and The Goblet of Fire', date: "2021-10-11", time: '9:00:00', runtime: 120, user_id: @user_1.id)
    @friendship = Friendship.create(follower_id:@user.id, followee_id:@user_1.id)
    @attendee =  Attendee.create(user_id:@user_1.id, event_id:@party.id)
    @attendee_1 = Attendee.create(user_id:@user.id, event_id:@party_1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit new_event_path
  end

  it 'has a form to create a new viewing party' do

    expect(page).to have_field('event[title]')
    expect(page).to have_field('event[runtime]')
    expect(page).to have_field('event[date]')
    expect(page).to have_field('event[time]')
    expect(page).to have_unchecked_field(:attendee[@user_1.email])

    fill_in 'event[title]', with: 'Pulp Fiction'
    fill_in 'event[runtime]', with: '90'
    fill_in 'event[date]', with: '2021-10-10'
    fill_in 'event[time]', with: '8:00:00'
    check :attendee[@user_1.email]
    click_button 'Create Party'

  
    expect(current_path).to eq(dashboard_path)

    within "#hostin-parties" do
      expect(page).to have_content('Pulp Fiction')
      expect(page).to have_content('90')
      expect(page).to have_content('2021-10-10')
      expect(page).to have_content('8:00:00')
      expect(page).to have_content(@user_1.email)
      expect(page).to have_content('Hosting')
    end
  end

  it 'has a sad path' do
    fill_in 'event[title]', with: '    '
    fill_in 'event[runtime]', with: '90'
    fill_in 'event[date]', with: '2021-10-10'
    fill_in 'event[time]', with: '8:00:00'
    check :attendee[@user_1.email]
    click_button 'Create Party'
    expect(page).to have_content('Party not created')
    expect(current_path).to eq(new_event_path)
  end
end
