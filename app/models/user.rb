class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #作成したuserモデルにdevise(アプリケーション)で使用する機能が記述されている
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#1:Nの関係になるモデル名の複数形を記述している。
#この場合、userモデルとpost_imageモデル。
#1人のユーザに対して複数個のpost_imageモデルを関連付けられる。
#postimageモデルは複数の投稿画像情報を保存するため複数型。
  has_many :post_images
#1:Nの関係になるモデル名の複数形を記述している。
#この場合、userモデルとpost_commentモデル。
#1人のユーザが複数個のコメント投稿を行うことができる。
#post_commentモデルは、複数個のコメント投稿を行うため、複数型。
  has_many :post_comments,dependent: :destroy
#user_idとpost_image_idをFavoriteモデルと関連づける。1:N
#post_commentモデルは、複数個のコメント投稿を行うため、複数型。
  has_many :favorites, dependent: :destroy
end
