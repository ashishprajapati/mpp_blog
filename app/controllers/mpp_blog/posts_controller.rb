require_dependency "mpp_blog/application_controller"

module MppBlog
  class PostsController < ApplicationController
    before_filter :authenticate_admin!, only: [:create, :new, :edit, :all, :draft, :published, :popular, :remove_from_popular]
    layout :set_blog_layout
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy, :update_popular]

    def index
      @blog_posts = MppBlog::Post.published.page params[:page]
    end

    def show
    end

    def new
      @blog_post = MppBlog::Post.new
    end

    def edit
    end

    def create
      @blog_post = MppBlog::Post.new(blog_post_params)
      if @blog_post.save
        redirect_to all_blog_posts_url, notice: 'Post was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @blog_post.update(blog_post_params)
        redirect_to all_blog_posts_url, notice: 'Post was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def category    
      @blog_posts = MppBlog::Post.published(params[:category]).page params[:page]
    end

    def all 
      @blog_posts = MppBlog::Post.all_posts(params[:category])
      @posts_count = MppBlog::Post.count_them
    end

    def draft    
      @blog_posts = MppBlog::Post.draft(params[:category])
      @posts_count = MppBlog::Post.count_them
      render action: "all"
    end

    def published
      @blog_posts = MppBlog::Post.published(params[:category])
      @posts_count = MppBlog::Post.count_them
      render action: "all"
    end

    def popular
      @blog_posts = MppBlog::Post.popular(params[:category])
      @posts_count = MppBlog::Post.count_them    
    end

    def update_popular
      @blog_post.popular = params[:popular]
      if @blog_post.save
        redirect_to :back
      end
    end

    def sort_popular
      @blog_posts = MppBlog::Post.popular(params[:category])
      @blog_posts.each do |blog_post|
        blog_post.position = params[:blog_post_ids].index(blog_post.id.to_s)
        blog_post.save  
      end
      respond_to do |format|
        format.json { render :json=>true}
      end
    end

    def subscription
      cookies[:subscription]=true
      subscription = Blog::Subscription.subscribe(params[:subscription].permit!)
      redirect_to :back, notice: subscription
    end

    def no_subscription
      cookies[:subscription]=true
      respond_to do |format|
        format.json { render :json=>true}
      end  
    end

    def destroy
      @blog_post.destroy
      redirect_to all_blog_posts_url, notice: 'Post was successfully destroyed.'
    end

    private
    def set_blog_post
      @blog_post = MppBlog::Post.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:title, :content, :status, :search_description, :avatar, :popular, :category_list => [])
    end

    def set_blog_layout
      if [:create, :new, :edit, :all, :draft, :published, :popular].include?(params[:action].to_sym)
        "admin"
      else 
        "mpp_blog/application"
      end
    end
  end
end
