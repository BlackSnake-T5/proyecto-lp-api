class Api::V1::AdopcionsController < ApplicationController
    
    # GET /adopcions
    def index
        @Adopcions = Adopcions.all
        render json: @Adopcions
    end

    # GET /adopcions/:id
    def get
        @Adopcions = Adopcions.find(params[:id])
        render json: @Adopcions
    end

    # POST /adopcions
    def create
        @Adopcions = Adopcions.new(Adopcions_params)
        if @Adopcions.save
            render json: @Adopcions
        else
            render error: { error: "No se pudo crear el mascota"}, status: 400
        end

    end

    # UPDATE /adopcions/:id
    def update
        @Adopcions = Adopcions.find(params[:id])
        if @Adopcions
            @Adopcions.update(Adopcions_params)
            render error: { error: "Mascota actualizada con éxito!"}, status: 200
        else
            render error: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    # DELETE /adopcions/:id
    def destroy
        @Adopcions = Adopcions.find(params[:id])
        if @Adopcions
            @Adopcions.state = false
            render error: { error: "Mascota eliminado con éxito!"}, status: 200
        else
            render error: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    private 

    def Adopcions_params
        params.require(:Adopcions).permit(:Adopcionsname,:password)
    end


end