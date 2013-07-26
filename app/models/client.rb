class Client < ActiveRecord::Base
  has_many :notes
  
  validates_presence_of :name
  
  default_scope -> { order("state desc") }
  scope :paid, -> { where(state: :paid) }
end
