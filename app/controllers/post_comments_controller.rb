class PostCommentsController < ApplicationController

#コメント投稿保存のためのアクション
	def create
#投稿されたコメントを保存した後は/post_images/:post_image_idへリダイレクトする
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
	end
#今回、コメント投稿だけの画面は作成しないためindexメソッドなどは作成しない。
#その代わり、投稿画像の詳細画面でコメント投稿機能を実装する。

private
def post_comment_params#フォームから送信されたデータを取得している
  params.require(:post_comment).permit(:user_id,
                      :post_image_id,
                      :comment)
end

end
