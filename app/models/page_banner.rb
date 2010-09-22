class PageBanner < ActiveRecord::Base
  validates_uniqueness_of :banner_id, :scope => :editable_id
  
  belongs_to :editable, :polymorphic => true
  belongs_to :banner
  
  default_scope :order => 'position'
  
  acts_as_list
  
end
