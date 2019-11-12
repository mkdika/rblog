class AdminController < ApplicationController
  layout 'mainadmin'
  before_action :authenticate_user!
  
  def index
    @dashboard = true
  end
end
