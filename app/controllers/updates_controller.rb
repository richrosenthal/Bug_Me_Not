class UpdatesController < ApplicationController
  def new
    if @ticket = Ticket.find_by_id(params[:ticket_id])
       @update = @ticket.updates.build
    else
      @update = Update.new
    end
  end 




  def create
    @update = current_user.updates.build(update_params)
    if @update.save
      redirect_to update_path(@update)
    else
      render :new
    end
  end

  def show
    @update = Update.find_by_id(params[:id])
  end

  def index
  end

  private

  def update_params
    params.require(:update).permit(:ticket_id, :content)
  end

end
