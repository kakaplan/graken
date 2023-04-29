class UpdatesController < ApplicationController
  before_action :require_admin, except: :index

  def index
    @updates = Update.all.order(params[:updated_at]).reverse_order
  end

  def new
    @update = Update.new
  end

  def create
    @update = Update.new(update_params)

    begin
      @update.save!
      flash[:notice] = "New update saved!"
      redirect_to updates_path
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = e
      render 'new', :status => unprocessable_entity
    end
  end

  def edit
    @update = Update.find(params[:id])
  end

  def update
    @update = Update.find(params[:id])
    if @update.update(update_params)
      flash[:notice] = "Update edits saved."
      redirect_to updates_path
    else
      render('edit')
    end
  end
  
  def delete
    @update = Update.find(params[:id])
  end

  def destroy
    flash[:notice] = "Update deleted."
    @update = Update.find(params[:id])
    @update.destroy
    redirect_to updates_path
  end

  private

  def update_params
    params.require(:update).permit(
      :title,
      :text
    )
  end

  def require_admin
    unless user_signed_in? and current_user.admin
      flash.alert = "You do not have permission to access this page."
      redirect_to root_path
    end
  end
end
