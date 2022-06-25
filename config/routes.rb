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
    get 'about' => 'homes#about'
    post 'confirm' => 'orders#confirm'
    get 'thanks' => 'orders#thanks'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index,:show]
    resources :orders, only: [:create, :update, :index, :new, :show]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:create, :index, :update, :destroy]
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
   resources :orders, only: [:show, :update]
  end
   resources :order_histories, only: [:update]
end





