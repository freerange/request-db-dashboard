require '../test_helper'

class RequestTest < Test::Unit::TestCase

  def test_be_able_to_count_requests
    assert_equal 4060, Request.count
  end

  def test_average_response
    assert_equal 0.114, Request.average_response_rate
  end

end