class Request < ActiveRecord::Base
  has_one :completed_line
  has_one :processing_line

  def self.average_response_rate(source = Source.last, remove_response = nil)
    query = where("completed_lines.source_id = #{source.id}").select("AVG(completed_lines.duration) as average_request_time").joins(:completed_line)
    query = query.where("completed_lines.status != #{remove_response}") if remove_response
    res = query.first.average_request_time
    (res * 1000).round.to_f / 1000
  end

  def self.slow(source = Source.last, remove_response = nil)
    query = where("completed_lines.source_id = #{source.id}").joins([:processing_line, :completed_line]).where("completed_lines.duration > 1").group("")
    query = query.where("completed_lines.status != #{remove_response}") if remove_response
    requests = query.all
    requests.inject({}) { |h,request|
      controller_action = "#{request.processing_line.controller}##{request.processing_line.action}.#{request.processing_line.format}"
      h[controller_action] ||= {:times => 0, :durations => []}
      h[controller_action][:times]+=1
      h[controller_action][:durations] << request.completed_line.duration
      h
    }.sort { |a,b| b[1][:times] <=> a[1][:times] }
  end
end