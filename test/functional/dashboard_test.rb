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

end