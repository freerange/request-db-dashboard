require '../test_helper'

class RequestTest < Test::Unit::TestCase

  def test_be_able_to_count_requests
    assert_equal 4060, Request.count
  end

  def test_average_response
    assert_equal 0.114, Request.average_response_rate
  end

  def test_find_slow_requests
    slow_requests = Request.slow
    assert_equal 11, slow_requests.size
    assert_equal "Account::SmsConfirmationsController#update.HTML", slow_requests[0][0], "Ordered by most frequently called"
    assert_equal 9, slow_requests[0][1][:times]

    assert_equal "ConversationsController#index.HTML", slow_requests[1][0], "Ordered by most frequently called"
    assert_equal 8, slow_requests[1][1][:times]
  end

end