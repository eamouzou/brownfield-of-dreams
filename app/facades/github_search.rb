class GithubSearch

  def initialize(github_token)
    @github_token = github_token
  end

  def user_repos
    service = GithubService.new(@github_token)
    service.get_repos.map do |repo_data|
      Repo.new(repo_data)
    end
  end
end
