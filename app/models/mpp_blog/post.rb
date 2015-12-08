module MppBlog
  class Post < ActiveRecord::Base
  	acts_as_taggable_on :categories
	paginates_per POST_LIMIT 
	def to_param
		"#{id} #{title}".parameterize
	end
	mount_uploader :avatar, MppBlog::BlogPostUploader	
	scope :all_posts, -> (category=nil) { 
		category.present? ? self.tagged_with(category) : self.all
	}
	scope :draft, ->  (category=nil) { 
		category.present? ? where(:status => false).tagged_with(category) : where(:status => false)
	}
	scope :published, -> (category=nil) { 
		category.present? ? where(:status => true).tagged_with(category) : where(:status => true)
	}
	scope :default_popular, -> { published.order(['popular DESC', 'position ASC']).limit(POPULAR_LIMIT) }
	scope :popular, -> (category=nil) { 
		category.present? ? published.where(:popular => true).tagged_with(category) : published.where(:popular => true)
		.order(:position)
	}
	scope :popular_count, -> { published.where(:popular => true).count}

	default_scope  {order('created_at DESC')}
	
	def post_status
		self.status ? "" : "Draft"
	end

	def self.count_them
		{all: self.count, draft: self.draft.count, published: self.published.count} 
	end

	def self.popular_limit
		popular_count < POPULAR_LIMIT
	end
  end
end
