require 'test_helper'

class SourceTest < Test::Unit::TestCase
  def test_correct_number_of_sources
    assert_equal 1, Source.count
  end
end