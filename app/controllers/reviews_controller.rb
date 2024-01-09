class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new]
  def index
    @reviews = Review.all
  end

  def new
    @property = Property.find(params[:property_id])
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @property = Property.find(params[:property_id])
    @review = @property.reviews.build(review_params);
    if @review.save
      redirect_to @property
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def review_params
    params.require(:review).permit(:title, :description, :ratings, images:[]).merge!({user: current_user})
  end
end
