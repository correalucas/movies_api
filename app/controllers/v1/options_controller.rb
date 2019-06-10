module V1
  class OptionsController < ApplicationController
    def purchase
      purchase = current_user.libraries.new(options_params)
      if purchase.save
        render json: { message: 'Movie/season successfully purchased' }, status: :created
      else
        render json: { errors: purchase.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def options_params
      params.permit(:user_id, :option_id)
    end
  end
end