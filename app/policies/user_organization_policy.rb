class UserOrganizationPolicy

  attr_reader :current_user, :model

  def initialize(current_user, model)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    @current_user = current_user
    @user_organization = model
  end

  def index?
    current_user.is_any_organization_admin?
  end
end