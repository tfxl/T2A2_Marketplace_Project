class OffersController < ApplicationController

  before_action :authenticate_user!
  before_action :identify_offer, only: %i[edit update reject_offer reset_offer destroy]
  before_action :check_if_authorised

  def index; end

  def new
    # render json: params
    @id = params[:id]

    @offer = Offer.new
    #@boards = Board.where(user: current_user)
    @boards = current_user.boards.where.not(status: 'Swap Agreed')
    

    @listing = Listing.find(@id)
    @hostname = @listing.user.first_name
  end

  def create

    updated_params = offer_params
    updated_params[:user] = current_user
    @offer = Offer.new(updated_params)

    @id = params[:offer][:listing_id]
    @boards = Board.where(user: current_user)

    @listing = Listing.find(@id)
    @hostname = @listing.user.first_name

    if @offer.valid?
      @offer.save
      @listing = Listing.find(offer_params[:listing_id])
      redirect_to listing_path(@listing)
    else
      validation_error_msg
    end 
  end

  def edit
    # @offer identified in before_action
    @id = @offer.listing.id

    #@boards = Board.where(user: current_user)
    @boards = current_user.boards.where.not(status: 'Swap Agreed')
    @hostname = @offer.listing.user.first_name
  end

  def update
    # @offer identified in before_action
    begin
      @offer.update!(offer_params)
      redirect_to listing_path(@offer.listing)
    rescue StandardError
      validation_error_msg
    end
  end

  def reject_offer
    # @offer identified in before_action
    reject_reset_offer('rejected')
  end

  def reset_offer
    # @offer identified in before_action
    reject_reset_offer("being re-considered")
  end

  def destroy
    # @offer identified in before_action
    listing = @offer.listing
    @offer.destroy
    redirect_to listing_path(listing)
  end


  ################### PRIVATE #########################################
  private

  def offer_params
    params.require(:offer).permit(:id, :comment, :status, :listing_id, :created_at, board_ids: [])
  end

  def identify_offer
    @offer = Offer.find(params[:id])
  end

  def reject_reset_offer(status) 
    @offer.update(status: status)
    listing = Listing.find(@offer.listing_id)
    redirect_to listing_path(listing)
  end

  def validation_error_msg
    flash[:errors] = @offer.errors.messages.values.flatten
    redirect_to(request.referrer || root_path)
  end

  def check_if_authorised
    # using pundit, check the permissions
    authorize @offer || Offer
  end

end
