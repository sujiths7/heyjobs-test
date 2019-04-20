require 'sqlite3'
require 'active_record'
require 'active_support'
require "awesome_print"
require 'pry'

Dir["#{File.dirname(__FILE__)}/config/*.rb"].each {|file| require_relative file }
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each {|file| require_relative file }

class JobAd
  def self.run
    LoadData.call
    remote_campaigns = FetchRemoteCampaign.call
    descripencies = CampaignDiscrepancy.call(remote_campaigns)
    ap descripencies
  end
end

JobAd.run
