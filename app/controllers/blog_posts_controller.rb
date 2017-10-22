class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.all
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      render json: { message: 'success'}
    else
      p @blog_post.errors.messages
      render json: { message: 'failed'}
    end
  end

  def edit
    @blog_post = BlogPost.find_by_id(params[:id])
  end

  private
    def blog_post_params
      params.require(:blog_post).permit(:title, :content, :account_id)
    end
end
