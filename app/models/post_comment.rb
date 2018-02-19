class PostComment < ApplicationRecord
#すでに他のモデルで、has_manyで関連付けしているので
#逆のbelongs_toを記述して実装している。1:Nの関係。
	belongs_to :user
	belongs_to :post_image
end
