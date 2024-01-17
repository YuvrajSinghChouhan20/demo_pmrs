class PropertiesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = current_user.properties.create(property_params)
    if @property
      redirect_to root_path, notice: "Property succesfully created"
    end
  end

  def update
    if @property.update(property_params)
      redirect_to property_path(@property), notice: "Property Updated Succesfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    redirect_to user_dashboard_path(@property.user), notice: "Property Destroyed"
  end

  private
  def property_params
    params.require(:property).permit(:property_type, :sub_property_type, :property_name, :price, :listed_for, :address, :city, :state, :zipcode, :property_size, :property_about, images: [])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
