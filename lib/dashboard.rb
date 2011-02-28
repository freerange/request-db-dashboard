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
    begin
      @average_response_rate = Request.average_response_rate
      @slow_requests = Request.slow
    rescue ActiveRecord::ConnectionNotEstablished, ActiveRecord::StatementInvalid
      @no_db_connection = true
    end
    haml :index
  end
end