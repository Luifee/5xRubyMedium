class Api::BaseController < ApplicationController
  before_action :check_login
  skip_before_action :verify_authenticity_token

  private

  def check_login
    unless user_signed_in?
      render json: {status: 'sign_in_first'}
      return
    end
  end
end
