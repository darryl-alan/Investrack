class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :connections
  has_many :references, through: :connections

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

  def can_add_reference?(user)
    ! references.where(id: user.id).exists?    
  end

  def self.search(query)
    query.strip!
    query.downcase!
    result = (name_matches(query) + email_matches(query)).uniq
  end

  private
  def self.name_matches(query)
    match('name', query)
  end

  def self.email_matches(query)
    match('email', query)
  end

  def self.match(col, query)
    User.where("#{col} like?", "%#{query}%")
  end
end
