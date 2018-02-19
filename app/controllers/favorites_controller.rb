class FavoritesController < ApplicationController

#記事にイイねをつけ、保存後、/post_images/へリダイレクトする
	def create
       post_image = PostImage.find(params[:post_image_id])
       favorite = current_user.favorites.new(post_image_id: post_image.id)
       favorite.save
       redirect_to post_images_path
	end
#findは指定したモデルのインスタンス（データ）を返す
	def destroy
       favorite = current_user.favorites.find_by(post_image_id: params[:post_image_id])
       favorite.destroy
       redirect_to post_images_path
	end

# 投稿画像の詳細画面で実装するため、index,newメソッドは作成しない。
end
