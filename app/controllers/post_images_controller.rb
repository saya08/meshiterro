class PostImagesController < ApplicationController
	def new#画像投稿画面を表示するためのアクション
		@post_image = PostImage.new#Postimageは空の投稿画像情報を保存するモデル
	end

	def create#投稿画像を保存するアクション
		#ストロングパラメータ（フォームから受け取ったデータをpost_image_params）で中身が大丈夫か確認しながら同名の箱に詰め直す
		@post_image = PostImage.new(post_image_params)
		#？箱の中のuser_idから、サインインしているユーザを取得する？
		@post_image.user_id = current_user.id
		#post_imageモデル（DB）へ保存する
		if @post_image.save
		#新規画面へリダイレクト
		redirect_to post_images_path
		#バリデーションチェックにより、データベースに保存が必要なカラム（imageとshop_name）が
		#入力されていなければsaveメソッドの際にfalseを返すようにされている。
		#その返されたバリデーションの結果をコントローラを使って検出している
		#newアクションに結びついたテンプレートを指定
	    else
	     render :new
	    end
	end

	def index#ログイン後トップページを表示するようにしたのでトップには投稿された画像をタイムラインで表示することにしている
	  @post_images = PostImage.page(params[:page]).reverse_order#1ページ分の決められた数のデータを新しい順にを取得し@post_images変数へ保存指示
	end#.allで複数のデータを格納するので、@post_imagesは複数形になる

	def show#詳細画面
	#投稿データをidで判別（params[:id]）findはDBから検索するメソッド
	  @post_image = PostImage.find(params[:id])
	#コメントのデータを格納する箱を渡している
	  @post_comment = PostComment.new
	end

private
	def post_image_params#投稿画像についてのハッシュチェック(複数の他のオブジェクトを管理するために使うオブジェクト)
	 params.require(:post_image).permit(:shop_name,:image,:caption,:user_id)
    end
end