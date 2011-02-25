require 'rubygems'
require "bundler/setup"

$LOAD_PATH << File.expand_path("../lib", __FILE__)

autoload :CompletedLine, 'models/completed_line'

require 'active_record'
