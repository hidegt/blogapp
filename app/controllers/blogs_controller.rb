class BlogsController < ApplicationController
  before_action :authenticate_user!
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      flash[:notice] = "Your blog was successfully created!!"
      redirect_to blog_path(@blog.id)
    else
      render :new
    end
  end
  def index
    @blogs = Blog.page(params[:page]).reverse_order
  end
  def show
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
  end
  def edit
    @blog = Blog.find(params[:id])
    if @blog.user == current_user
      render "edit"
    else
      redirect_to blogs_path
    end
  end
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:notice] = "Blog was succesfully updated!!"
      redirect_to blog_path(@blog.id)
    else
      render "edit"
    end
  end
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice] = "Your blog was successfully destroyed!!"
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :image, :body)
  end
end
