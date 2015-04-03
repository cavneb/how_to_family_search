class Admin::UsersController < ApplicationController
  before_action :admin_only
  layout 'admin'

  def index
    @users = User.all.order("id asc")
  end

end
