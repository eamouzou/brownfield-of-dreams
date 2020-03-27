require 'rails_helper'

RSpec.describe 'A registered user' do

  it "I visit dashboard and see github section", :vcr do
    user = create(:user, github_token: ENV['GITHUB_USER_TOKEN'])
    visit login_path

    fill_in'session[email]', with: user.email
    fill_in'session[password]', with: user.password
    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    within '.github' do
      expect(page).to have_content("Github")
      expect(page).to have_content("Repositories")
      expect(page).to have_css('.repos')
      expect(page).to have_css('.repo', count: 5)
    end

    within(first('.repo')) do
     expect(page).to have_link('activerecord-obstacle-course', href: 'https://github.com/DavidHoltkamp1/activerecord-obstacle-course')
    end
  end

  it "I see github followers in the github section of the user dashboard", :vcr do
    user = create(:user, github_token: ENV['GITHUB_USER_TOKEN'])
    visit login_path

    fill_in'session[email]', with: user.email
    fill_in'session[password]', with: user.password
    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    within '.github' do
      expect(page).to have_content("Followers")
      expect(page).to have_css('.followers')
    end

    within '.followers' do
      expect(page).to have_link('philjdelong', href: 'https://github.com/philjdelong')
      expect(page).to have_link('PaulDebevec', href: 'https://github.com/PaulDebevec')
    end
  end
end
