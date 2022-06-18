Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #作ったコントローラーの場所を記述
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: { #passwordの変更、sign_up機能の削除
    sessions: "admin/sessions" #管理者はログイン機能のみ
  }
  
  
  #顧客側のルート
  namespace :public do
    resources :customers
  end
  
   scope module: :public do
    root to: 'homes#top'
  end
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
