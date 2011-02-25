class CompletedLine < ActiveRecord::Base
  
  def self.average_response_rate
    (self.average("duration") * 1000).round.to_f / 1000
  end
end