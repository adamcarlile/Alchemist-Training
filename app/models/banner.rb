require_dependency File.join('vendor/plugins/plugin-banners/app/models/banner')
class Banner < ActiveRecord::Base
  #
  # Make this class polymorphic 
  #
  
  named_scope :visible
  
  has_many :banner_callouts
  
  attachment_options = {
     :url => "/upload/:rails_env/banners/:id/:style_:basename.:extension",
     :path => ":rails_root/public/upload/:rails_env/banners/:id/:style_:basename.:extension",
     :styles => { 
       :thumb   => "80x80#", 
       :small   => "300x300",
       :banner => "920x250#",
       :admin_thumb => "238x148#"
     }
   }
   
  has_attached_file :banner, attachment_options
end