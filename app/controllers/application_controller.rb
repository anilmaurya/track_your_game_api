class ApplicationController < ActionController::API
  before_filter :current_user, :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def login
    render nothing: true
  end

  def cors_set_access_control_headers
    set_header
  end

  def set_header
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def cors_preflight_check
    if request.method == :options
      set_header
      render :text => '', :content_type => 'text/plain'
    end
  end

  def current_user

  end
  helper_method :current_user
end
