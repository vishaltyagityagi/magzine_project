class Article < ActiveRecord::Base
	belongs_to :magzine
	has_many :comments, :as => :commentable
 
	belongs_to :user

  validates_presence_of :body, :title
	validates_uniqueness_of :title
	validates_length_of :title, maximum: 50
	validates_length_of :body, minimum: 50
end
