require 'rubygems'
require "bundler/setup"

$LOAD_PATH << File.expand_path("../lib", __FILE__)

autoload :CompletedLine, 'models/completed_line'
autoload :ProcessingLine, 'models/processing_line'
autoload :Request, 'models/request'
autoload :Dashboard, 'dashboard'

require 'active_record'
