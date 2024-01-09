class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @properties = Property.all #where(verified: true)
  end

  def new
    @property = Property.new
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def create
    @property = current_user.properties.create(properties_params)
    if @property
      redirect_to root_path, notice: "Property succesfully created"
    end
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(properties_params)
      redirect_to property_path(@property), notice: "Property Updated Succesfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property = Property.find(params[:id])
    if @property.destroy
      redirect_to user_dashboard_path(@property.user), notice: "Property Destroyed"
    else
      redirect_to user_dashboard_path(@property.user), alert: "Error please try again"
    end
  end

  private

  def properties_params
    params.require(:property).permit(:property_type, :sub_property_type, :property_name, :price, :listed_for, :address, :city, :state, :zipcode, :property_size, :property_about, images: [])
  end


end
