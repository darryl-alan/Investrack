class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.search(params[:stock])
      if @stock.nil?
        flash.now[:danger] = "Stock not found for symbol: " + params[:stock]
      end
    else
      flash.now[:danger] = "Please enter a symbol to search"
    end

    respond_to do |format|
      format.js { render partial: "users/stock_search_result" }
    end
  end
end
