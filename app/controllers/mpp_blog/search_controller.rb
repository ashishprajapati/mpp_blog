require_dependency "mpp_blog/application_controller"

module MppBlog
  class SearchController < ApplicationController
  		def index
			@blog_posts = MppBlog::Post.published.where("title LIKE ? OR content like ? OR search_description like?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
		end
  end
end
