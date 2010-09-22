ActionController::Routing::Routes.draw do |map|

  map.namespace(:admin) do |admin|
    admin.resources :pages do |pages|
      pages.resources :page_banners, :collection => {:sort => :post}
    end
  end

end
