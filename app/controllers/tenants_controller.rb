class TenantsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def index
        tenants = Tenant.all
        render json: tenants
    end

    def update
        tenant = find
        tenant.update!(tenant_params)
        render json: tenant, status: :accepted
    end

    def destroy
        tenant = find
        tenant.destroy!
        head :no_content
    end

    private

    def find
        Tenant.find(params[:id])
    end

    def tenant_params
        params.require(:tenant).permit(:name, :age)
    end

    def render_unprocessable_entity_response (invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Tenant not found" }, status: :not_found
    end

end
