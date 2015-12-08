module MppBlog
  module PostsHelper
  	def arrange_tags_admin(tags, action)
		tag_urls = []
		tags.each do |tag|
			tag_urls << "<a href=\"/blog/posts/#{action}/#{tag}\"><div class=\"show-categories-list\" style=\"margin-left:5px;\">#{tag}</div></a>"
		end
		tag_urls.to_a.join(", ").html_safe
	end

	def add_tags(tags)
		tag_urls = []
		tags.each do |tag|
			tag_urls << "<a data-category=\"#{tag}\" href=\"#\" class=\"tag-add\"><div class=\"add-tag-field\">#{tag}</div></a>"
		end
		tag_urls.to_a.join(", ").html_safe
	end

	def arrange_tags(tags)
		tags.to_a.join(", ")
	end

	def botton_check(status, new_var, update_var)
		status ? update_var : new_var
	end

	def add_tags_front_end(tags)
		tag_urls = []
		tags.each do |tag|
			tag_urls << "<li class=\"category-labels\"><a href=\"/blog/posts/category/#{tag}\">#{tag}</a></li>"
		end
		tag_urls.join("").html_safe
	end

	def prev_btn
		'<span style="font-size: 10px;" class="glyphicon glyphicon-chevron-left"></span> Older'.html_safe
	end

	def next_btn
		'Newer <span style="font-size: 10px;" class="glyphicon glyphicon-chevron-right"></span>'.html_safe
	end

	def popular_posts
		MppBlog::Post.default_popular
	end

	def post_share_seo
		if !@blog_post.blank? && params[:controller]=="blog/posts"
			meta_data=""
			if !@blog_post.try(:search_description).blank?
				meta_data+="<meta content=\"#{@blog_post.try(:search_description)}\" name='description'/>"
			elsif !@blog_post.try(:content).blank?
				meta_data+="<meta content=\"#{@blog_post.try(:content).to_s.truncate(160)}\" name='description'/>"
			end
			meta_data+="\n<link href=\"#{@blog_post.try(:avatar).try(:url)}\" rel='image_src'/>"
			return  meta_data.html_safe
		end
	end
	
	def nl2br(s)
	  s.to_s.gsub(/\n/, '<br>')
	end	

	def nl2space(s)
	  s.to_s.gsub(/\r\n/, '')
	end
  end
end
