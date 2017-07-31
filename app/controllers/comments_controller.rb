class CommentsController < ApplicationController
  before_filter :authenticate_user!
	before_filter :get_parent
	
  
  def new
    @comment = @parent.comments.build
    respond_to do |format|
      format.js
      format.html {
        redirect_to root_path
      }
    end
  end

	def create
		@comment = @parent.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = @parent.is_a?(Article)? @parent.id : @parent.article.id
		@comment.save
	end

  def get_parent
    @parent = Article.find_by_id(params[:article_id]) if params[:article_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    respond_to do |format|
    	format.js {
    		unless defined?(@parent)
    			"window.location=#{root_path}"
    		end
    	}
    	format.html {
    		redirect_to root_path unless defined?(@parent)		
    	}
    end
    
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.comments.size == 0
      @comment.destroy
    end

  end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
