module Api
  class FeedbacksController < ApplicationController
    def create
      if params[:name].blank? || params[:comment].blank?
        render json: { error: 'Something went wrong, try again' }, status: :unprocessable_entity
      else
        render json: { message: 'Successfully submitted your feedback' }, status: :ok
      end
    end
  end
end
