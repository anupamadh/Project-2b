class ReviewsController < ApplicationController

before_action :find_product
before_action :find_review, only: [:edit, :update, :destroy]

def index
end

def new
end

def create

@review = Review.new(review_params)
@review.product_id = @product.id
@review.user_id = current_user.id

   if @review.save
     flash[:success] = "Review created!"
     redirect_to product_path(@product)
   else
    #  flash[:warning] = "Please enter your review"
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

def review_params
  params.require(:review).permit(:content)
end

def find_review
  @review = Review.find(params[:id])
end


end
