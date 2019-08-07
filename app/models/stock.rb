class Stock < ApplicationRecord
  def self.search(code)
    begin
      StockQuote::Stock.new(api_key: "pk_1a42cb106a294ee98add0abd565751ad")
	  stock = StockQuote::Stock.quote(code)	  
      new(name: stock.company_name, code: stock.symbol, price: stock.latest_price)
    rescue Exception => e
      return nil
    end
  end
end
