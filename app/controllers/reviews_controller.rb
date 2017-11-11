class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)

    @review.user_id = current_user.id

    if @review.save
      redirect_to :controller=>'products', :action=>"show", :id=>@product.id
    else
      redirect_to :controller=>'products', :action=>"show", :id=>@product.id
    end
  end

  def review_params
    params.require(:review).permit(
      :user_id,
      :product_id,
      :description,
      :rating
    )
  end

  def destroy
    @review =
    @review.destroy
    redirect_to :controller=>'products', :action=>"show", :id=>@product.id
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to comment!"
    end
  end

end
