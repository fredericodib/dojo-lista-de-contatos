Rails.application.routes.draw do
	root 'contatos#index'
	resources :contatos, only: [:create, :show, :delete]
end
