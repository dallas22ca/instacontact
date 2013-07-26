class Note < ActiveRecord::Base
  belongs_to :client
  
  validates_presence_of :body, allow_blank: false
end
