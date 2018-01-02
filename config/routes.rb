Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      controller :mice do
        get '/all' => :index, as: 'mice'
        get '/mouse/:original_id' => :show, as: 'mouse'
      end

      namespace :mice do
        controller :search do
          get '/find' => :index
        end
      end

    end
  end
end
