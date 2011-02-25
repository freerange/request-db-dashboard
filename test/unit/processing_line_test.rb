require '../test_helper'

class ProcessingLineTest < Test::Unit::TestCase

  def test_be_able_to_count_processing_lines
    assert_equal 4004, ProcessingLine.count
  end

end