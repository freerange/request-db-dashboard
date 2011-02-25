require '../test_helper'

# testing on an example requests sqlite3 db
class CompletedLineTest < Test::Unit::TestCase

  def test_be_able_to_count_completed_lines
    assert_equal 4004, CompletedLine.count
  end
end