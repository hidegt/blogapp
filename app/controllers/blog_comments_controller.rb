class BlogCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = current_user.blog_comments.new(blog_comment_params)
    @comment.blog_id = @blog.id
    @comment.save
    #redirect_to request.referer
  end
  def destroy
    @blog = Blog.find(params[:blog_id])
    blog_comment = BlogComment.find_by(id: params[:id], blog_id: params[:blog_id])
    blog_comment.destroy
    #redirect_to request.referer
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
