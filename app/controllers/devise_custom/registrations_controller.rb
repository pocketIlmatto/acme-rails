class DeviseCustom::RegistrationsController < Devise::RegistrationsController

  #TODO is there a better way to validate user to the organization
  def create
    if Organization.validate_token(params[:user][:organization_id], params[:user][:organization_token])
      super
      #TODO error handling?
      resource.user_organizations.create(organization_id: params[:user][:organization_id])
    else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      resource.errors.messages[:organization_token] = [ 'is invalid.' ]
      render :new
    end
    
  end

end