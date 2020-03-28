class AuthSessionsController < ApplicationController
  def create
    current_user.update(github_token: auth_github_token)
    redirect_to '/dashboard'
  end

  private

  def auth_github_token
    request.env['omniauth.auth']['credentials']['token']
  end

end
