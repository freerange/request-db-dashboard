require File.expand_path('../../environment',__FILE__)
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

# set up test db connection
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => File.expand_path("../data/requests.db", __FILE__)
)