class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(division_params)
    if @product.save
      redirect_to products_path
    else 
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @products = Product.find(params[:id])
    if @products.update(products_params)
      flash[:notice] = "Product Updated"
      redirect_to products_path
    else
      render :edit  
    end
  end

  def destroy
   @product = Product.find(params[:id])
   @product.destroy
   flash[:notice] = "Product Deleted"
   redirect_to products_path
  end

  private
    def division_params
      params.require(:product).permit(:name)
    end
end