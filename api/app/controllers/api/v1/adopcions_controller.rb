class Api::V1::AdopcionsController < ApplicationController
    
    # GET /Adopcions
    def index
        @Adopcions = Adopcion.all
        render json: @Adopcions
    end

    # GET /Adopcions/:id
    def show
        @Adopcion = Adopcion.find(params[:id])
        render json: @Adopcion
    end

    # POST /Adopcions
    def create
        @Adopcion = Adopcion.new(adopcion_params)
        if @Adopcion.save
            render json: @Adopcion
        else
            render json: { error: "No se pudo crear el mascota"}, status: 400
        end

    end

    # UPDATE /Adopcions/:id
    def update
        @Adopcion = Adopcion.find(params[:id])
        if @Adopcion
            @Adopcion.update(adopcion_params)
            render json: { response: "Mascota actualizada con éxito!"}, status: 200
        else
            render json: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    # DELETE /Adopcions/:id
    def destroy
        @Adopcion = Adopcion.find(params[:id])
        if @Adopcion
            @Adopcion.state = false
            render json: { response: "Mascota eliminado con éxito!"}, status: 200
        else
            render json: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    private 

    def adopcion_params
        params.require(:adopcion).permit(:adopter_id,:donante_id,:pets_id)
    end


end