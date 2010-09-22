require_dependency File.join('vendor/plugins/cms-engine/app/models/page')
class Page < ActiveRecord::Base
  
  %w(editable_banners).each do |method_name|
      Page.class_eval <<-EOS
        def self.#{method_name}=(value)
          meta_def :#{method_name} do
            value
          end
          meta_def :#{method_name}? do
            value
          end
        end
        def #{method_name}
          self.class.#{method_name}
        end
        def #{method_name}?
          self.class.#{method_name}
        end
     EOS
  end  
  
  self.editable_banners = false
  
  has_many :page_banners, :as => :editable 
  
  def visible_polymorphic_page_asset(klass = :banners)
    relationship = klass
    klass = klass.to_s.camelize.singularize.constantize 
    callouts = ''
    p = self
    until !callouts.blank?
      callouts = p.send("page_#{relationship}").map {|c| c.send(relationship.to_s.singularize)}
      p = p.parent
      if p.nil?
        callouts = klass.visible
        break
      end
    end
    callouts
  end
  
  def assigned_banners
    self.page_banners
  end
  
  def can_have_banners?
    self.editable_banners
  end
  
end