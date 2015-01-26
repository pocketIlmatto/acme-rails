class UserOrganization < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  validates :organization_id, :user_id, presence: :true
  validates :user_id, uniqueness: { scope: :organization_id, message: "should only be associated with the organization once"}
end