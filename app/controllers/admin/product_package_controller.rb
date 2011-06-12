class Admin::ProductPackageController < ApplicationController

  before_filter :authorize

  def product_packages
    @product = Product.find(params[:product])
  end
  
  def create_product_package
    @product = Product.find(params[:product_package][:product_id])
    @product_package = ProductPackage.new(params[:product_package])
    if @product_package.save
      flash[:notice] = "Product Package record created succesfully"
    else
      flash[:notice] = "Error creating Product Package record"
    end
    redirect_to(product_packages_url)
  end

  def edit_product_package
    @product_package = ProductPackage.find(params[:product_package])
  end
  
  def update_product_package
    @product_package = ProductPackage.find(params[:product_package][:id])
    if @product_package.update_attributes(params[:product_package])
      flash[:notice] = "Prouct Package record updated succesfully"
      redirect_to :controller => 'admin', :action => 'product_packages', :product => @product_package.product
    else
      flash[:notice] = "Error updating Product Package"
      render :action => 'edit_product_package'
    end
  end

  def delete_product_package
    ProductPackage.destroy(params[:product_package])
    redirect_to(product_packages_url)
  end

end