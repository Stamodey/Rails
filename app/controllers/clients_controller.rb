class ClientsController < ApplicationController
  def index
    @clients = Client.page(params[:page]).per(8)
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
  
    if @client.save
      redirect_to clients_path
    else
      # Если ошибка валидации из-за уникальности, добавляем сообщение
      if @client.errors[:phone].any? || @client.errors[:email].any?
        flash[:alert] = "A client with this phone or email already exists."
      end
      @clients = Client.page(params[:page]).per(8)
      render 'index'
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to clients_path
    else
      render 'index'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :surname, :phone, :email, :address)
  end
end
