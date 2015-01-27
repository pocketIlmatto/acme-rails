class ApiKey < ActiveRecord::Base
  before_create :generate_access_token
  attr_encrypted :access_token, key: 'abcdefg'
  
  private

  def generate_access_token
    begin
      self.access_token = Devise.friendly_token
    end while self.class.exists?(encrypted_access_token: ApiKey.encrypt_access_token(access_token))
  end

  #generic json api access token: 2kLZQFDzsn22Uc6d9Mjs
end
