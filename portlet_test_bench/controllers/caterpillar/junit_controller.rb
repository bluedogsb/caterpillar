class Caterpillar::JunitController < Caterpillar::ApplicationController

  # test response 200 OK
	def index
		render :text => ""
	end

	# Sets a session value so the single SESSION_KEY cookie is set.
  # The output XML prints the session ID and the JUnit test compares this
  # to the value from another request, and with the same cookie they should match.
	def session_cookie
		session[:the_time] = Time.now.to_s
		render :text => request.session_options.to_xml
	end
  
  def redirect
    redirect_to :action => :redirect_target
  end
  def redirect_target
    render :text => request.request_uri
  end

	# Sets multiple cookies and redirects.
 	def cookies_with_redirect
		cookies[:user_agent] = request.user_agent
		cookies[:the_time]   = Time.now.to_s
		redirect_to :action => "cookies_with_redirect_target"
	end
	def cookies_with_redirect_target
    render :text => cookies.to_xml
	end


#   # inspect the request variables
#   def req
#     s = "<html><body>"
# 
#     request.env.each_pair do |key,value|
#       s += key
#       s += " => "
#       s += value unless value.nil?
#       s += "<br />"
#     end
# 
#     s += "</body></html>"
#     render :inline => s
#   end

end