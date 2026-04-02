Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  get "experience", to: "pages#experience"
  get "projects", to: "pages#projects"
  get "skills", to: "pages#skills"
  get "contact", to: "pages#contact"

  get "blog", to: "blog#index"
  get "blog/:slug", to: "blog#show", as: :blog_post
end
