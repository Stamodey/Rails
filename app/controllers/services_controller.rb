class ServicesController < ApplicationController
  def index
    # Пагинация и создание нового объекта
    @services = Service.page(params[:page]).per(8)
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
  
    if @service.save
      # Перенаправляем на страницу со списком услуг
      redirect_to services_path
    else
      # Если ошибка при валидации
      flash[:alert] = "Please fix the errors below."
      @services = Service.page(params[:page]).per(8)
      render 'index'
    end
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to services_path
    else
      render 'index'
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :price)
  end
end
