class PropertiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def index
    @properties = Property.all #where(verified: true)
  end

  def new
    @property = Property.new
  end

  def show
    @property = Property.find(params[:id])
  end

  def create
    user = current_user
    @property = user.properties.create(properties_params)
    if @property
      redirect_to root_path, notice: "Property succesfully created"
    end
  end

  def update
  end

  def destroy
  end

  private

  def properties_params
    params[:property].merge!(status: "available")
    params.require(:property).permit(:property_type, :sub_property_type, :property_name, :listed_for, :address, :city, :state, :zipcode, :property_size, images: [])
  end


end