class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  def stock_in_portfolio?(code)
    stock = Stock.find_by(code: code)
    return false if stock.nil?
    user_stocks.where(stock_id: stock.id).exists?
  end

  def under_portfolio_limit?
    user_stocks.count < 50
  end

  def can_add_stock?(code)
    under_portfolio_limit? && !stock_in_portfolio?(code)
  end
end
