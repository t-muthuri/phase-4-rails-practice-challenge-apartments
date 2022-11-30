class ApartmentsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def update
        apartment = find
        apartment.update!(apartment_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = find
        apartment.destroy
        head :no_content
    end

    private

    def find
        Apartment.find(params[:id])
    end

    def apartment_params
        params.require(:apartment).permit(:number)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Apartment not found" }, status: :not_found
    end
    
end
