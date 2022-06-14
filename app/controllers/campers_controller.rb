class CampersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index 
        render json: Camper.all
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper 
    end

    private 

    def record_invalid(exception)
        render json: { errors: exception.record.errors.full_messages }
    end

    def record_not_found 
        render json: { error: "Camper not found"}
    end

    def camper_params 
        params.permit(:name, :age)
    end
end
