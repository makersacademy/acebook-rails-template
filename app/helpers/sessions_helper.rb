module SessionsHelper
	def current_user_can_edit_post
		current_user and current_user.can_edit? post
	end
end
