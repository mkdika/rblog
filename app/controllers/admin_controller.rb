class AdminController < ApplicationController
  layout 'mainadmin'
  
  def index
    @dashboard = true
  end
end
