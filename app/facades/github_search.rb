class GithubSearch

  def initialize(github_token)
    @github_token = github_token
  end

  def user_repos
    service = GithubService.new(@github_token)
    all_repos = service.get_repos.map do |repo_data|
      Repo.new(repo_data)
    end
    all_repos.sample(5)
  end
end
