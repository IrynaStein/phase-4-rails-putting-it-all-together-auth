class RecipesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record_response

    before_action :authorize

    def index
        recipes = Recipe.all
       render json: recipes
    end

    def create
        user = User.find_by(id: session[:user_id])
        recipe = user.recipes.create!(recipe_params)
        # byebug
        render json: recipe, status: :created
    end

    private

    def authorize
        return render json: {errors: ["Unauthorized access"]}, status: :unauthorized unless session.include?(:user_id)
    end

    def recipe_params
        params.permit(:title, :minutes_to_complete, :instructions)
    end

    def render_invalid_record_response(invalid)
        # byebug
        render json: {errors: [invalid.record.errors.full_messages]}, status: :unprocessable_entity
    end
end
