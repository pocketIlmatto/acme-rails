class Api::ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :json
  before_action :default_json

  #Concerns
  include TokenAuthentication
  
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(encrypted_access_token: ApiKey.encrypt_access_token(token))
    end
  end

  protected

    def default_json
      request.format = :json if params[:format].nil?
    end

end