class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate
  after_action :track_action

  def user_count
    @count = User.count
  end

  def question_count
    @count = Question.count
  end

  def answer_count
    @count = Answer.count
  end

  def tenant_requests
    tenants = Tenant.all
    formatted_list = []
    tenants.each do |tenant|
      request_count = Ahoy::Event.where(user_id: tenant.id).count
      hash = { tenantName: tenant.name, requestCount: request_count }
      formatted_list.push(hash)
    end
    formatted_list
  end

  helper_method :tenant_requests
  helper_method :user_count
  helper_method :answer_count
  helper_method :question_count

  protected

  # track events with ahoy_matey gem.
  def track_action
    ahoy.track "Viewed #{controller_name}##{action_name}", request.filtered_parameters
  end

  def authenticate
    authenticate_token
    ahoy.authenticate(@current_user)
  end

  def authenticate_token
    authenticate_or_request_with_http_token do |token|
      @current_user = Tenant.find_by(api_key: token)
    end
  end
end
