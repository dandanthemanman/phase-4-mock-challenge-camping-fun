class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def create 
        signup = Signup.create!(signup_params)
        render json: signup.activity
    end

    private 

    def invalid_record(exception)
        render json: {errors: exception.record.errors.full_messages}
    end

    def signup_params 
        params.permit(:time, :camper_id, :activity_id)
    end
end
