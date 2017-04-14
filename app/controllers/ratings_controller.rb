class RatingsController < ApplicationController
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

  private
  def rating_params
    params.require(:rating).permit(:rating,:description,:user_id,:product_id)
  end
end
