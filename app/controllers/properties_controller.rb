class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def create
    user = current_user
    property = user.properties.create()
  end

  def update
  end

  def destroy
  end

  private

  def properties_params
    params.require(:properties).permit(:property_type, :property_sub_type, :registraion_no, :address, :city, :state, :zip, :images)
  end
end
