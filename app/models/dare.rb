class Dare < ActiveRecord::Base
    attr_accessible :content, :accepted, :accepted_by
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  #validates :accepted, presence: true
  default_scope order: 'dares.created_at DESC'
  
end
