class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.search(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: "users/stock_search_result" }
        end
      else
        respond_to do |format|
          flash.now[:danger] = "Stock not found for symbol: " + params[:stock]
          format.js { render partial: "users/stock_search_result" }
        end
      end
    else      
      respond_to do |format|
        flash.now[:danger] = "Please enter a symbol to search"
        format.js { render partial: "users/stock_search_result" }
      end
    end
  end
end
