Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords],controllers: {
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
    resources :items, only: [:index,:show]
    resources :orders, only: [:conform,:index,:new,:show,:thanks]
    resources :cart_items, only: [:index]
    end
  end

