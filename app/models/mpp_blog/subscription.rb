module MppBlog
  class Subscription < ActiveRecord::Base
  	def self.subscribe(subscription)
		if where(:email=>subscription[:email]).blank?
			create(subscription)
			msg =  "You are successfully subscribed with us"
		else	
			msg = "You are already subscribed with us"
		end
		msg
	end	

	def self.unsubscribe(subscription)
		where(:email=>subscription[:email]).destroy_all
		msg = "You are unsubscribed"
	end
  end
end
