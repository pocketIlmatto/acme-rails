class UserOrganizationsController < ApplicationController

  def index
    authorize UserOrganization
    @organizations = current_user.organizations_as_admin
    @user_organizations = UserOrganization.where(organization_id: @organizations).order(organization_id: :asc)
  end

end