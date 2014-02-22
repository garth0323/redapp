class PostCategory < ActiveRecord::Base
	belongs_to :cateogry
	belongs_to :post
end