class SessionsController < ApplicationController
  require 'csv'

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
    @session = Session.last
    authorize @session
    if @session.list.empty? == false
      @session.list.each do |element|
        id = element.to_i
        product = Product.where(id: id).first
        product.status = "vendu"
        product.save
      end
      # prepare my csv with Model function
      csv = @session.generate_csv2
      # prepare email and forward csv as argument
      ProposalMailer.generatecsv2(csv).deliver_now
      @session.destroy
      redirect_to root_path
      flash[:notice] = "le CSV a bien été transmis."
    else
      redirect_to caisse_path
      flash[:notice] = "la liste est vide."
    end
  end

  def destroy
    @session = Session.find(params[:id])
    authorize @session
    @session.destroy
    redirect_to root_path
  end

  def list
    @session = Session.last
    @item = product.find(params[:id])
    @session.list
  end

end
