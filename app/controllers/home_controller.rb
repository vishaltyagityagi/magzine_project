class HomeController < ApplicationController

	def index
  	@magzines = Magzine.all
	end
end
