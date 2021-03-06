class TicketsController < ApplicationController

  def new
    @ticket = Ticket.new
    @ticket.build_project
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = session[:user_id]
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def index
    @tickets = Ticket.all
    @user = session[:user_id]

  end

  def show
    @ticket = Ticket.find_by_id(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :project_id, project_attributes: [:name])
  end

end
