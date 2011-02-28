class Request < ActiveRecord::Base
  has_one :completed_line
  has_one :processing_line

  def self.average_response_rate
    res = select("AVG(completed_lines.duration) as average_request_time").joins(:completed_line).first.average_request_time
    (res * 1000).round.to_f / 1000
  end
end