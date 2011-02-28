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
    set :root, File.expand_path("../..", __FILE__)
  end

  get "/" do
    begin
      @source = Source.last # use as default

      @filter_for_reponses = 200

      @average_response_rate = Request.average_response_rate(@source, @filter_for_reponses)
      @slow_requests = Request.slow(@source, @filter_for_reponses)
      @showing_for_requests = CompletedLine.where(:status => @filter_for_reponses).where(:source_id => @source.id).count

      @total_rows = Request.count
      @processed = Source.count
    rescue ActiveRecord::ConnectionNotEstablished, ActiveRecord::StatementInvalid => e
      @no_db_connection = true
    end
    haml :index
  end
end