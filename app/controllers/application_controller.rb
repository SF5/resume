class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # saves the location before loading each page so we can return to the
  # right page. If we're on a devise page, we don't want to store that as the
  # place to return to (for example, we don't want to return to the sign in page
  # after signing in), which is what the :unless prevents
  before_action :store_current_location, :unless => :devise_controller?

  private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:admin, request.url)
  end
  
  #private
  # override the devise method for where to go after signing out because theirs
  # always goes to the root path. Because devise uses a session variable and
  # the session is destroyed on log out, we need to use request.referrer
  # root_path is there as a backup
  #def after_sign_out_path_for(resource)
    #request.referrer || root_path
  #end
  
  #add_flash_types :success, :warning, :danger, :info
  def local_request?
  false
  end

  def exception(exception=nil)
    if exception
      logger = Logger.new(STDOUT)
      logger.debug "Exception Message: #{exception.message} \n"
      logger.debug "Exception Class: #{exception.class} \n"
      logger.debug "Exception Backtrace: \n"
      logger.debug exception.backtrace.join("\n")
      if [ActionController::RoutingError, ActionController::UnknownController, ActionController::UnknownAction].include?(exception.class)
        return render_404
      else
        return render_500
      end
    end
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end
end