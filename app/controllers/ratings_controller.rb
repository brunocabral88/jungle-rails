class RatingsController < ApplicationController
  before_action :check_if_logged_in

  def create
    # rating = Rating.new(rating_params)
    rating = Rating.new({
      product_id: params[:product_id],
      description: params[:rating][:description],
      rating: params[:rating][:rating] 
    })
    rating.user = current_user
    if rating.save
      flash[:success] = "Review sent successfully!"
      redirect_to root_path
    else
      flash[:danger] = "Error when creating review"
      redirect_to Product.find(params[:product_id])
    end
  end

  def destroy
    rating = Rating.find_by(id: params[:id])
    if current_user == rating.user && rating.destroy
      flash[:success] = "Review deleted!"
      redirect_to rating.product
    else
      flash[:warning] = "There was a problem trying to delete this review"
      redirect_to rating.product
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:rating,:description,:user_id,:product_id)
  end

  def check_if_logged_in
    unless logged_in?
      flash[:warning] = "You have to be logged in to create reviews"
      redirect_to root_path
    end
  end
end
