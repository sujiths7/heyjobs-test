# Set up a database that resides in RAM
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

# Set up database tables and columns
ActiveRecord::Schema.define do
  create_table :jobs, force: true do |t|
    t.string :title
    t.string :description
  end
  create_table :campaigns, force: true do |t|
    t.references :job
    t.integer :status
    t.string :external_reference
    t.string :ad_description
  end
end

# Set up model classes
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Campaign < ApplicationRecord
  belongs_to :job
  enum status: %i(active paused deleted)
end

class Job < ApplicationRecord
  has_many :campaigns
end
