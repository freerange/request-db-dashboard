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
    Request.stubs(:average_response_rate).raises(ActiveRecord::ConnectionNotEstablished)
    get '/'
    assert last_response.body.include?('No Database Connection Found')
  end

  def test_show_average_response_rate
    get "/"
    assert last_response.body.include?('average_response_rate')
    assert last_response.body.include?('183ms')
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