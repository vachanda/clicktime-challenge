module Api
	class BaseController < ActionController::API
		include ActionView::Rendering
		
		def send_response(template, locals, status) 
			render template: template, locals: locals, status: status
		end
	end
end