#!/usr/bin/env ruby
require "environment"

# set up running db connection
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => File.expand_path("../db/requests.db", __FILE__)
)

run Dashboard