class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record_response

before_action :authorize, only: [:show]

    def create
        # byebug
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        # byebug
        user = User.find_by(id: session[:user_id])
        render json: user
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

    def authorize
        return render json: {error: ["Unauthorized access. Please login"]}, status: :unauthorized unless session.include?(:user_id)
    end

    def render_invalid_record_response(invalid)
        # byebug
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
