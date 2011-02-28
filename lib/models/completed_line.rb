class CompletedLine < ActiveRecord::Base
  belongs_to :source
  belongs_to :processing_line, :foreign_key => "request_id"
end