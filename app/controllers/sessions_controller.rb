class SessionsController < ApplicationController

  def index
    @sessions = Session.all
  end

  def new
    @session = Session.new
    authorize @session
  end

  def create
    @session = Session.new
    authorize @session
    @session.save
    redirect_to session_path
  end

  def display
    if Session.last.present? && Session.last.status == "pending"
      # @session = Session.last
      # authorize @session
      redirect_to caisse_path
    else
      @session = Session.new
      @session.save!
      redirect_to caisse_path
    end
  end

  # def caisse
  #   @session = Session.last
  #   authorize @session
  # end

  def validation
    @session = Session.find(params[:id])
    authorize @session
    @session.status = "validate"
    @session.save
    redirect_to roots_path
  end

  def destroy
    @session = Session.find(params[:id])
    authorize @session
    @session.destroy
    redirect_to roots_path
  end

  def list
    @session = Session.last
    @item = product.find(params[:id])
    @session.list
  end
end
