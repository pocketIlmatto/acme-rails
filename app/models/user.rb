class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: :true
  has_many :patients, through: :patient_caretakers
  has_many :patient_caretakers
  has_many :user_organizations
  has_many :organizations, through: :user_organizations
  #has_many :organizations_as_admin, -> { where "role = 'Admin'" }, class_name: "UserOrganization", foreign_key: "user_id"
  attr_accessor :organization_id, :organization_token

  def name
    [first_name, last_name].compact.join(' ')
  end

  def is_organization_admin?(organization)
    !self.organizations_as_admin.where(organization_id: organization).empty?
  end

  def organizations_as_admin
    UserOrganization.where(role: 'Admin', user_id: self.id).map {|uo| uo.organization_id} 
  end

  def is_any_organization_admin?
    !self.organizations_as_admin.empty?
  end

end
