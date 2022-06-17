Rails.application.routes.draw do
  namespace :api do
    resources :players
  end
end

#https://guides.rubyonrails.org/routing.html
# resources :bananas
# creates seven different routes in your application, all mapping to the Bananas controller:

# GET	/bananas	bananas#index	display a list of all bananas
# GET	/bananas/new	bananas#new	return an HTML form for creating a new banana
# POST	/bananas	bananas#create	create a new banana
# GET	/bananas/:id	bananas#show	display a specific banana
# GET	/bananas/:id/edit	bananas#edit	return an HTML form for editing a banana
# PATCH/PUT	/bananas/:id	bananas#update	update a specific banana
# DELETE	/bananas/:id	bananas#destroy	delete a specific banana