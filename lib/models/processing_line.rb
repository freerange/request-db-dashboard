class ProcessingLine < ActiveRecord::Base
  belongs_to :completed_line, :foreign_key => "request_id"
end