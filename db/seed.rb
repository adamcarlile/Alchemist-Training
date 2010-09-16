[User,Page,Image,FileUpload].each do |klass|
  klass.destroy_all
end

%w(cms_user writer editor admin).each {|name| Role.find_or_create_by_name(name)}

user = User.new({
  :firstname => 'Your',
  :lastname => 'Name',
  :email => "youremail@example.com",
  :password => 'password',
  :password_confirmation => 'password',
})
user.save!
user.activate!
user.roles = Role.all
 
global_nav = Factory(:top_level_folder)
Factory(:top_level_folder, :title => 'Footer nav')
Factory(:top_level_folder, :title => 'Other pages')

# Homepage
Factory(:published_page, :type => 'Homepage', :position => 1, :parent_id => global_nav.id, :title => 'Welcome to our site', :slug_path => 'home', :nav_title => 'Home')

# Folder with basic sub pages
Factory(:published_page, :position => 2, :state => 'published', :visible => true, :parent_id => global_nav.id, :title => "Logistics")
Factory(:published_page, :position => 2, :state => 'published', :visible => true, :parent_id => global_nav.id, :title => "Security")
Factory(:published_page, :position => 2, :state => 'published', :visible => true, :parent_id => global_nav.id, :title => "Construction")
Factory(:published_page, :position => 2, :state => 'published', :visible => true, :parent_id => global_nav.id, :title => "Business Admin")
Factory(:published_page, :position => 2, :state => 'published', :visible => true, :parent_id => global_nav.id, :title => "Customer Service")

Page.all.each &:save