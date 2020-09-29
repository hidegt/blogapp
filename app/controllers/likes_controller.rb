class LikesController < ApplicationController
  def create
    blog = Blog.find(params[:blog_id])
    like = current_user.likes.new(blog_id: blog.id)
    like.save
    redirect_to blog_path(blog)
  end
  def destroy
    blog = Blog.find(params[:blog_id])
    like = current_user.likes.find_by(blog_id: blog.id)
    like.destroy
    redirect_to blog_path(blog)
  end
end
