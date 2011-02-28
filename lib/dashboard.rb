require "sinatra"
require "sinatra/base"
require "haml"

class Dashboard < Sinatra::Base
  configure :development do
    enable :logging, :dump_errors, :raise_errors
    set :show_exceptions, true
  end

  configure :production do
    enable :logging
  end

  configure do
    set :root, File.expand_path("../", __FILE__)
  end

  get "/" do
    haml :index
  end
end