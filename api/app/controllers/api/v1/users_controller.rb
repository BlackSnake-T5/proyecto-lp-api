class Api::V1::UsersController < ApplicationController
    # GET /users
    def index
        @users = User.all
        render json: @users
    end

    # GET /users/:id
    def get
        @user = User.find(params[:id])
        render json: @user
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render error: { error: "No se pudo crear el usuario"}, status: 400
        end

    end

    # UPDATE /users/:id
    def update
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render error: { error: "Usuario actualizado con éxito!"}, status: 200
        else
            render error: { error: "No se pudo actualizar el usuario!"}, status: 400
        end
    end

    # DELETE /users/:id
    def destroy
        @user = User.find(params[:id])
        if @user
            @user.state = false
            render error: { error: "Usuario eliminado con éxito!"}, status: 200
        else
            render error: { error: "No se pudo actualizar el usuario!"}, status: 400
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username,:password)
    end


end
