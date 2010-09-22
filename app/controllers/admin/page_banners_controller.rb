class Admin::PageBannersController < Admin::BaseController
  setup_resource_controller
  
  require_role :admin
  
  belongs_to :page
  
  index.response do |wants|
    wants.html { 
      @banners = Banner.all
      @active = parent_object.page_banners(:include => :banners)
      @available = Banner.visible
    }
  end
  
  destroy.response do |wants|
    wants.html { redirect_to edit_parent_object_path }
  end

  update.response do |wants|
    wants.html { redirect_to edit_parent_object_path }
  end
  
  create.response do |wants|
    wants.html { redirect_to edit_parent_object_path }
  end

  create.fails.response do |wants|
    wants.html do
      flash[:error] = "Failed to add banner"
      redirect_to edit_parent_object_path
    end
  end

  def sort
    params[:page_banner].each_with_index do |id, index|
      PageBanner.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true, :status => 200
  end
  
  private
  
    def edit_parent_object_path(extra_params = {})
      send("edit_admin_#{parent_type}_path", parent_object, extra_params) + '#Banners'
    end
end
