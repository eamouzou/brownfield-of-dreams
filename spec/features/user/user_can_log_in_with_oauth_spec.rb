require 'rails_helper'

RSpec.describe 'Log in with OAuth' do

  it "user without token can login after process" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(page).to have_link("Connect to GitHub")
  end

end
