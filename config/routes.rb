Rails.application.routes.draw do
  devise_for :customers
  
  #作ったコントローラーの場所を記述
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: { #passwordの変更、sign_up機能の削除
    sessions: "admin/sessions" #管理者はログイン機能のみ
  }
  
  namespace :admin do
   root :to =>"homes#top"
   resources :customers, only: [:index, :show, :edit, :update]
   resources :items, except: [:destroy]
   
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
