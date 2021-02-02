class Api::V1::PetsController < ApplicationController
    
    # GET /pets
    def index
        @pets = Pet.all()
        @pets = @pets.by_age(params[:from],params[:to]) if params[:from].present? or params[:to].present?

        filtering_params(params).each do |key, value|
            @pets = @pets.public_send("by_#{key}",value) if value.present?
        end
        
        render json: @pets
    end

    def filtering_params(params)
        params.slice(:breed, :type, :gender, :adopted)
    end

    # GET /pets/:id
    def show
        @pet = Pet.find(params[:id])
        render json: @pet
    end

    # POST /pets
    def create
        @pet = Pet.new(pet_params)
        if @pet.save
            render json: @pet
        else
            render json: { error: "No se pudo crear el mascota"}, status: 400
        end

    end

    # UPDATE /pets/:id
    def update
        @pet = Pet.find(params[:id])
        if @pet
            @pet.update(pet_params)
            render json: { response: "Mascota actualizada con éxito!"}, status: 200
        else
            render json: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    # DELETE /pets/:id
    def destroy
        @pet = Pet.find(params[:id])
        if @pet
            @pet.state = false
            render json: { response: "Mascota eliminado con éxito!"}, status: 200
        else
            render json: { error: "No se pudo actualizar el mascota!"}, status: 400
        end
    end

    private 

    def pet_params
        params.require(:pet).permit(:type_of_pet,:breed,:age,:gender,:name)
    end


end
