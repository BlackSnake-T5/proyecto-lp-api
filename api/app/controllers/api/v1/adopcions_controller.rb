class Api::V1::AdopcionsController < ApplicationController
    
    # GET /Adopcions
    def index
        @Adopcions = Adopcion.all
        render json: @Adopcions
    end

    # GET /Adopcions/:id
    def get
        @Adopcion = Adopcion.find(params[:id])
        render json: @Adopcion
    end

    # POST /Adopcions
    def create
        @Adopcion = Adopcion.new(Adopcion_params)
        if @Adopcion.save
            render json: @Adopcion
        else
            render error: { error: "No se pudo crear el mascota"}, status: 400
        end

    end

    # UPDATE /Adopcions/:id
    def update
        @Adopcion = Adopcion.find(params[:id])
        if @Adopcion
            @Adopcion.update(Adopcion_params)
            render error: { error: "Mascota actualizada con éxito!"}, status: 200
        else
            render error: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    # DELETE /Adopcions/:id
    def destroy
        @Adopcion = Adopcion.find(params[:id])
        if @Adopcion
            @Adopcion.state = false
            render error: { error: "Mascota eliminado con éxito!"}, status: 200
        else
            render error: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    private 

    def Adopcion_params
        params.require(:Adopcion).permit(:Adopcionname,:password)
    end


end