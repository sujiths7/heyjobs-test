class CampaignDiscrepancy
  include Callable

  def initialize(remote_campaigns)
    @remote_campaigns = remote_campaigns
  end

  def call
    campaign_reference_ids = @remote_campaigns.pluck('reference')
    @local_campaigns = Campaign.where(external_reference: campaign_reference_ids)
    find_descripencies
  end

  private
  attr_reader :remote_campaigns

  def find_descripencies
    result = []
    @remote_campaigns.each do |remote_campaign|
      local_campaign = @local_campaigns.find_by(external_reference: remote_campaign['reference'])
      descripencies = descripencies_between(remote_campaign, local_campaign)
      unless descripencies.empty?
        result << {
                    remote_refernce: remote_campaign['reference'],
                    descripencies: descripencies
                  }
      end
    end
    result
  end

  def descripencies_between(remote_campaign, local_campaign)
    descripencies = []
    if local_campaign.status != remote_campaign['status']
      descripencies << {
                         status: {
                           local: local_campaign.status,
                           remote: remote_campaign['status']
                         }
                       }
    end

    if local_campaign.ad_description != remote_campaign['description']
      descripencies << {
                         description: {
                           local: local_campaign.ad_description,
                           remote: remote_campaign['description']
                         }
                       }
    end
    descripencies
  end
end
