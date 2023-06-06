Rails.application.routes.draw do
  get "/", :controller => "places", :action => "index"
  resources "places"
  resources "posts"
  resources "sessions"
  resources "users"

  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"

  get "/", :controller => "marketing_pages", :action => "home"
end
