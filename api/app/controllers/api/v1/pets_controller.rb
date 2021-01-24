class Api::V1::PetsController < ApplicationController
    
    # GET /pets
    def index
        @Pets = Pet.all
        render json: @Pets
    end

    # GET /pets/:id
    def get
        @Pet = Pet.find(params[:id])
        render json: @Pet
    end

    # POST /pets
    def create
        @Pet = Pet.new(Pet_params)
        if @Pet.save
            render json: @Pet
        else
            render error: { error: "No se pudo crear el mascota"}, status: 400
        end

    end

    # UPDATE /pets/:id
    def update
        @Pet = Pet.find(params[:id])
        if @Pet
            @Pet.update(Pet_params)
            render error: { error: "Mascota actualizada con éxito!"}, status: 200
        else
            render error: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    # DELETE /pets/:id
    def destroy
        @Pet = Pet.find(params[:id])
        if @Pet
            @Pet.state = false
            render error: { error: "Mascota eliminado con éxito!"}, status: 200
        else
            render error: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    private 

    def Pet_params
        params.require(:Pet).permit(:Petname,:password)
    end


end
