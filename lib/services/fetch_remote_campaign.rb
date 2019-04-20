require 'httparty'

class FetchRemoteCampaign
  include Callable

  def call
    response = HTTParty.get(REMOTE_CAMPAIGNS_URL)
    JSON.parse(response.body)['ads']
  end
end
