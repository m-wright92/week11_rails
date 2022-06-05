# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[root index]
  before_action :authenticate_user!, except: %i[show index] do
    redirect_to products_path unless current_user&.admin?
  end

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product added!'
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
    if @products.update(product_params)
      flash[:notice] = 'Product Updated'
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Product Deleted'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :cost, :coo)
  end
end
