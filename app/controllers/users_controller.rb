class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

end