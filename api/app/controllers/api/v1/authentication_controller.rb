class Api::V1::AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
   
    def authenticate
      command = AuthenticateUser.call(params[:username], params[:password])
      puts command
      if command.success?
        render json: command.result
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end
   end