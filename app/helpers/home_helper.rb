module HomeHelper
	def login_path
		return Rails.env.development? ? "/auth/vkontakte" : "/auth/developer"
	end
end
