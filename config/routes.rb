Rails.application.routes.draw do
  
  
  post 'user_token' => 'user_token#create'
	namespace 'api' do 
  		namespace 'v1' do 
  			#post 'authenticate', to: 'authentication#authenticate'
  			root 'home#index'
  			resources :users
  			resources :places
  			resources :orders
  			resources :examples
  			resources :ingredients
  			#resources :users  
			
			resources :meals do	
				resources :recipes
			end
			resources :bills do	
				resources :bill_meals
			end
			post '/login' => 'user_token#create'
			post '/register'=>'users#create'
			get 'auth' => 'home#auth'
			get '/users'=> 'users#index'
  			get '/users/current'=>'users#current'
  			patch '/user/:id'=> 'users#update'
			delete '/user/:id'=>'users#destroy'
			get '/users/get_user/'=>'users#get_current_User'

  		end
  	end
	# root 'ingredients#new'
	# get '/ingredients' => 'ingredients#index'
	# put '/ingredients/:id' =>'ingredients#update'
	# get '/meals/new'=>'meals#new'
	# get '/meals' => 'meals#index'
end
