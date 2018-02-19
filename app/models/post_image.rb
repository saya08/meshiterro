class PostImage < ApplicationRecord
#画像アップロードを実装している。
	attachment :image#←指定するフィールド名はimage_idから_idをのぞいた名前にするのがルール。

#models/user.rbに記述したhas_manyと関連している。(has_manyの逆なのでbelongs_toを使っている)
#belongs_toはPostimageモデルからuser_idに紐づいて
#Userモデルを参照できることを指している。1:Nの関係。
#Postimageモデルに紐づくのは一つのUserモデル（ユーザ情報）のため単数形になる。
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments,dependent: :destroy
#favorited_by?メソッド（データを処理するもの）は、
#引数（値）で渡されたユーザのIDがFavoritesテーブル内に含まれているかどうかを調べる。
#含まれていればTrue、含まれていなければFalseを返すようにしている。
#投稿された画像のイイねに自分が含まれているかどうか。
#その後の表示と昨日は、shoe.viewで行う。

#画像投稿とショップ名を必須にするためバリデーションを設定。
#投稿画像情報を保存するためのPostImageモデルにこれを追加する。
#バリデーション(validates)で対象とする項目にpresence(存在)がtrueかをチェックしている
	validates :shop_name, presence: true
	validates :image, presence: true

    def favorited_by?(user)
       favorites.where(user_id: user.id).exists?
    end
end
