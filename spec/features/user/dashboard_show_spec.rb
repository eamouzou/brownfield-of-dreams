require 'rails_helper'

RSpec.describe 'A registered user' do

  it "I visit dashboard and see github section" do
    user = create(:user, github_token: "token acbee3261cd728ee327aa3d8379b84a774634edf")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    within '.github' do
      expect(page).to have_content("Github")
      expect(page).to have_content("Repositories")
      # expect(page).to have_link("Repo 1 link - name")
      # expect(page).to have_link("Repo 2 link - name")
      # expect(page).to have_link("Repo 3 link - name")
      # expect(page).to have_link("Repo 4 link - name")
      # expect(page).to have_link("Repo 5 link - name")
      expect(page).to have_css('.repos')
      expect(page).to have_css('.repo', count: 5)
    end
  end
end
