class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.joins(:account).all
    respond_to do |format|
      format.html
    end
  end

  def new
    @blog_post = BlogPost.new
  end

  def create_blog
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      respond_to do |format|
        format.json {render json: 'success'}
      end
    else
      respond_to do |format|
        format.json {render json: 'failed'}
      end
    end
  end

  def show_blog
    @blog_post = BlogPost.find_by_id(params[:id])
  end

  def new_blog
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def sort_blogs
    @blog_posts = BlogPost.joins(:account).order("created_at #{params[:sort]}")
    render json: @blog_posts.collect{
      |x| [x.id, x.title, x.content, x.account.full_name,
        x.created_at.strftime('%d-%b-%Y %H:%M')]}
  end

  def edit
    @blog_post = BlogPost.find_by_id(params[:id])
  end

  private
    def blog_post_params
      params.require(:blog_post).permit(:title, :content, :account_id)
    end
end
