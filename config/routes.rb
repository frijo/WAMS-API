Rails.application.routes.draw do
  
  
	namespace 'api' do 
  		namespace 'v1' do 
  			resources :examples
  			resources :ingredients  
			resources :meals do
				resources :recipes
			end
			
  		end
  	end
	# root 'ingredients#new'
	# get '/ingredients' => 'ingredients#index'
	# put '/ingredients/:id' =>'ingredients#update'
	# get '/meals/new'=>'meals#new'
	# get '/meals' => 'meals#index'
end
