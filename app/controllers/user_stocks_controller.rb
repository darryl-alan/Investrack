class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by(code: params[:stock])
    if stock.blank?
      stock = Stock.search(params[:stock])
      stock.save
    end

    user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{user_stock.stock.name} added to portfolio"
    redirect_to portfolio_path
  end

  def destroy
	@UserStock = UserStock.find(params[:id])
	@UserStock.destroy
	flash[:success] = "Stock removed from portfolio"
    redirect_to portfolio_path
  end
end
