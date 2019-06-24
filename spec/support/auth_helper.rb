module AuthHelper
  def http_login(tenant)
    token = tenant.api_key
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(token)
  end
end
