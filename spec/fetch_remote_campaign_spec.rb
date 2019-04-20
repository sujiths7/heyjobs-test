require 'sqlite3'
require 'active_record'
require 'active_support'
require "awesome_print"
require 'pry'

Dir["#{File.dirname(__FILE__)}/../config/*.rb"].each {|file| require_relative file }
Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each {|file| require_relative file }

RSpec.describe FetchRemoteCampaign do
  it "fetch ads(remote campaigns) from ad sources" do
    remote_campaigns = FetchRemoteCampaign.call
    expect(remote_campaigns.class).to eq(Hash)
  end
end
