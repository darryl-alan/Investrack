class UsersController < ApplicationController
  def portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end

  def references
    @references = current_user.references
  end

  def search
    if params[:query].present?
      @users = User.search(params[:query]).reject { |u| u.id == current_user.id }
      if @users.blank?
        flash.now[:danger] = "No users found"
      end
    else
      flash.now[:danger] = "Please enter search query"
    end
    respond_to do |format|
      format.js { render partial: "references/user_search_result" }
    end
  end
end
