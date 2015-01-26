class Organization < ActiveRecord::Base
  include Encryption
  attr_encrypted :token, key: :org_encryption_key
  validates :name, :encrypted_token, presence: true
  has_many :user_organizations
  has_many :users, through: :user_organizations

  def self.validate_token(id, token)
    Organization.find(id).token == token
  end 
end