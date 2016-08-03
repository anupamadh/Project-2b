class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
  
    # code for searching for a product
    if params[:search]
          @products = Product.search(params[:search]).order('created_at DESC')
          if @products.length == 0
            flash[:warning] = "There are no products containing the term(s)"
          end
    else
          @products =Product.all.order('created_at DESC')
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    # respond_to do |format|
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
    # end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
    # end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :price)
  end

  def check_admin
    if current_user.admin?
    end
  end
end
