class Favorite < ApplicationRecord
#Favoriteモデルのカラムであるuser_idと
#post_image_id(投稿画像のid)をUserモデルとPostImageモデルのidと関連づけ
  belongs_to :user
  belongs_to :post_image
end
