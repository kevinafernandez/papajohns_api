# frozen_string_literal: true

# == ApplicationController
class ApplicationController < ActionController::API
  before_action :authorize_request_api

  def authorize_request_api
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With,
																							 Content-Type, Accept, Authorization'
  end
end
