require 'test_helper'

class DashboardTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Dashboard
  end

  def test_it_contains_the_title
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('Request Dashboard')
  end

  def test_when_no_database_say_so
    ActiveRecord::Base.remove_connection # simulate no database connection
    get '/'
    assert last_response.body.include?('No Database Connection Found')

    # reconnect - not nice, refactor later...
      ActiveRecord::Base.establish_connection(
        :adapter => "sqlite3",
        :database => File.expand_path("../../data/requests.db", __FILE__)
      )
  end

  def test_show_average_response_rate
    get "/"
    assert last_response.body.include?('average_response_rate')
    assert last_response.body.include?('114ms')
  end

  def test_show_slow_requests
    get "/"
    assert last_response.body.include?('slow_requests')
    assert last_response.body.include?('11')
  end

  def test_show_source_number
    get "/"
    assert last_response.body.include?('Processed: 1')
  end

end