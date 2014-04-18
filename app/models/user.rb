class User < ActiveRecord::Base
	def self.find_by_omni(auth)
		where(auth.slice("uid","provider")).first || create_by_omni(auth)
	end
	
	def self.create_by_omni(auth)
		create! do |user|
			user.uid=auth.uid
			user.provider=auth.provider
			if auth.provider=="vkontakte"
				user.picture_url=auth.info.image
				user.name=auth.info.name
			end
		end
	end	
end
