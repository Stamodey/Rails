# class PhotographersController < ApplicationController
#   def index
#     @photographers = Photographer.page(params[:page]).per(8)
#     @photographer = Photographer.new
#   end

#   def create
#     @photographer = Photographer.new(photographer_params)
#     if @photographer.save
#       redirect_to photographers_path
#     else
#       render 'index'
#     end
#   end

#   def update
#     @photographer = Photographer.find(params[:id])
#     if @photographer.update(photographer_params)
#       redirect_to photographers_path
#     else
#       render 'index'
#     end
#   end

#   def destroy
#     @photographer = Photographer.find(params[:id])
#     @photographer.destroy
#     redirect_to photographers_path
#   end

#   private

#   def photographer_params
#     params.require(:photographer).permit(:name, :surname, :phone, :email, :portfolio)
#   end
# end
class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.page(params[:page]).per(8)
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(photographer_params)
  
    if @photographer.save
      redirect_to photographers_path
    else
      # Если ошибка валидации из-за уникальности, добавляем сообщение
      if @photographer.errors[:phone].any? || @photographer.errors[:email].any?
        flash[:alert] = "A photographer with this phone or email already exists."
      end
      @photographers = Photographer.page(params[:page]).per(8)
      render 'index'
    end
  end
  

  def update
    @photographer = Photographer.find(params[:id])
    if @photographer.update(photographer_params)
      redirect_to photographers_path
    else
      render 'index'
    end
  end

  def destroy
    @photographer = Photographer.find(params[:id])
    @photographer.destroy
    redirect_to photographers_path
  end

  private

  def photographer_params
    params.require(:photographer).permit(:name, :surname, :phone, :email, :portfolio)
  end
end
