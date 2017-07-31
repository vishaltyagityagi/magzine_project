class Magzine < ActiveRecord::Base
	belongs_to :user
	has_many :articles
	validates :title, :description, presence: true
	validates_uniqueness_of :title
	validates_length_of :title, maximum: 50
end
