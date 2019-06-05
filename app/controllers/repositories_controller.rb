class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 0132c25a6668e6a15380
    client_secret = 753759e72a87f3b52c13bb24045799378f0715ad
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end
    body = JSON.parse(resp.body)
    @repositories = body["items"]

    render 'search'
  end
end
