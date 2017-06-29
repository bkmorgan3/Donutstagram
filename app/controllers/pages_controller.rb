class PagesController < ApplicationController
  before_action :authorize, only: [:secret]

  def home
  end

  def secret
  end


end
