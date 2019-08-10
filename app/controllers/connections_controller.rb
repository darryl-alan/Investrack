class ConnectionsController < ApplicationController
  def create
    ref = User.find(params[:reference_id])
    current_user.references << ref

    # this also works => note that this one is current_user.connections instead of .references
    # current_user.connections.build(reference_id: ref.id)

    if current_user.save
      flash[:success] = "Reference added"
    else
      flash[:danger] = "Oops, something went wrong. Details: " + current_user.errors.full_messages
    end

    redirect_to references_path
  end

  def destroy
    conn = current_user.connections.find_by(reference_id: params[:id])
    if conn.destroy
      flash[:success] = "Reference removed"
    else
      flash[:danger] = "Oops, something went wrong. Details: " + conn.errors.full_messages
    end
    
    redirect_to references_path
  end
end
