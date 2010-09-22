require_dependency File.join('vendor/plugins/cms-engine/app/controllers/public/base_controller')
class Public::BaseController < CMSController
  
  def render_page
    load_shared_pages
    set_page_types_ivars
    set_banners
    set_meta_data
    add_page_breadcrumbs
    render_page_template
  end
  
  def set_banners
    @banners = @page.visible_polymorphic_page_asset(:banners)
  end
  
end