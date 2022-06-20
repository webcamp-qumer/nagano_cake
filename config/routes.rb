Rails.application.routes.draw do

  
  devise_for :customers, skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  #顧客側のルート
  namespace :public do
    resources :customers
    # 退会確認画面
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end
   scope module: :public do
    root to: 'homes#top'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index,:show]
    resources :orders, only: [:conform,:index,:new,:show,:thanks]
    resources :cart_items, only: [:index]
    end

  #作ったコントローラーの場所を記述
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: { #passwordの変更、sign_up機能の削除
    sessions: "admin/sessions" #管理者はログイン機能のみ
  }
  namespace :admin do
   root :to =>"homes#top"
   resources :customers, only: [:index, :show, :edit, :update]
   resources :items, except: [:destroy]
   resources :genres, only: [:index, :create, :edit, :update]
  end
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end