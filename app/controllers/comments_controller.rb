class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit(:body))
		@comment.user_id = 1

		if @comment.save
			flash[:notice] = "Comment Saved!"
			redirect_to post_path(@post)
		else
			render 'posts/show'
		end
	end

end