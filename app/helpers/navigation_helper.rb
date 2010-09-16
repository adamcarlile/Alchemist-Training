require File.join('vendor/plugins/cms-engine/app/helpers/navigation_helper')
module NavigationHelper 
  def render_global_nav
    pages = Page.find_by_title('Global nav').published_children_for_nav
    list_items = pages.map do |page|
      css_classes = []
      css_classes << 'first' if page == pages.first
      css_classes << 'last' if page == pages.last
      if page == @root_page
        css_classes << "current"
      end
      css_class = css_classes.join(' ') unless css_classes.empty?
      nav_title = content_tag(:span, h(page.nav_title))
  
      content_tag('li', link_to(nav_title, url_for_page(page)), :class => css_class, :id => page.slug)
    end
    content_tag('nav',content_tag('ul', "\n#{list_items.join("\n")}\n", :class => "clearfix"), :id => "main_navigation", :class => "clearfix")
  end
end