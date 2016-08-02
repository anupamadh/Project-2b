class ReviewsController < ApplicationController
# before_action :require_login, only: [:create, :destroy]
# before_action :correct_review, only: [:destroy]
before_action :find_product
before_action :find_review, only: [:edit, :update, :destroy]

def index
end

def new
  @review = Review.new
end

def create

@review = Review.new(review_params)
@review.product_id = @product.id
@review.user_id = current_user.id

   if @review.save
     flash[:success] = "Review created!"
     redirect_to product_path(@product)
   else
     render 'new'
   end
end

def edit

end

def update

  if @review.update(review_params)
    redirect_to product_path(@product)
  else
    render 'edit'
  end
end

def destroy
  @review.destroy
    flash[:success] = "Review deleted"
    redirect_to product_path(@product)
end

private

def find_product
@product = Product.find(params[:product_id])
end

# def set_review
#   @review = review.find(params[:id])
# end

def review_params
  params.require(:review).permit(:content)
  # params.require(:review).permit(:content).merge(user_id: current_user.id)
end

def find_review
  @review = Review.find(params[:id])
end

# def correct_review
#     @review = Review.find(params[:id])
#     unless (current_user[:id] == @review.user_id)
#     flash[:danger] = "This is not your login. Do you want to login again?"
#     redirect_to current_user
#   end
# end

# def require_logout
#   if logged_in?
#   flash[:warning] = "You must be logged out to create a new review"
#   redirect_to(root_url)
# end
# end

end
