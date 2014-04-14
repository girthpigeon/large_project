class Dare < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  default_scope order: 'dares.created_at DESC'
end
