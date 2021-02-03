class Api::V1::AdopcionsController < ApplicationController
    
    # GET /Adopcions
    def index
        @adopcions = Adopcion.where(nil)
        filtering_params(params).each do |key, value|
            @adopcions = @adopcions.public_send("by_#{key}",value) if value.present?
        end
        render json: @adopcions
    end

    # GET /Adopcions/:id
    def show
        @adopcion = Adopcion.find(params[:id])
        render json: @adopcion
    end

    # POST /Adopcions
    def create
        @adopcion = Adopcion.new(adopcion_params)
        if @adopcion.save
            render json: @adopcion
        else
            render json: { error: "No se pudo crear el mascota"}, status: 400
        end

    end

    # UPDATE /Adopcions/:id
    def update
        @adopcion = Adopcion.find(params[:id])
        if @adopcion
            unless adopcion_params[:adopter_id].nil?
                pet = Pet.find(@adopcion.pets_id)
                if pet
                    pet.update_attribute(:adopted, true)
                end
            end
            @adopcion.update(adopcion_params)
            render json: { response: "Mascota actualizada con éxito!"}, status: 200
        else
            render json: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    # DELETE /Adopcions/:id
    def destroy
        @adopcion = Adopcion.find(params[:id])
        if @adopcion
            
            render json: { response: "Mascota eliminado con éxito!"}, status: 200
        else
            render json: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    private 

    def adopcion_params
        params.require(:adopcion).permit(:adopter_id,:donante_id,:pets_id)
    end

    def filtering_params(params)
        params.slice(:pet, :adopter, :donante)
    end


end