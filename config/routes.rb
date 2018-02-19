Rails.application.routes.draw do
	#devise(libraryを使用する際にURLとしてusersを含む
  devise_for :users
#ユーザ認証成功後、投稿画像の一覧画面が表示されるようにしている
  root 'post_images#index'

 resources :post_images, only: [:new, :create, :index, :show]

#コメント投稿する際のルーティングを設定する。
#投稿画像の詳細画面にアクセスしたらpost_commentsコントローラのcreateアクションに誘導
#同時にpost_imagesコントローラのアクションに誘導
#アクションが複数のため、resourcesで複数形
 resources :post_images,only:[:new,:create,:index,:show]do
#いいね機能のルーティング
 	resource :favorites, only:[:create, :destroy]
 	resource :post_comments,only:[:create,:destroy]
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
