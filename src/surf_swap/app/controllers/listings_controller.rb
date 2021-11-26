class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :identify_listing, only: %i[show edit update destroy]
  before_action :identify_boards, only: %i[create show edit update destroy]
  before_action :preload_addresses, only: %i[new create edit update]
  before_action :check_if_authorised, except: %i[index my_listings see_user_listings]
  before_action :check_availability_prior_listing, only: %i[new]

  include FormatTimedate

  def index
    # before_action identify_boards
    @listings = Listing.where(status: 'available')

    @no_listings_msg = "Sorry, no currently available listings.
    Please check back later or make one yourself !"

    @title = 'Surfboard Listings'
    @descriptive_line1 = 'Find a board below that you want to check out!'
    @descriptive_line2 = '(Some boards are part of a multi-item swap only)'
  end

  def my_listings
    @no_listings_msg = "You don't have any current listings. Do you want to make one ?"
    @listings = Listing.where(user: current_user)
    @title = 'Your Surfboard Listings'
    @descriptive_line1 = 'Select view to check any offers'
    @descriptive_line2 = '(all listings included, even those with Meetups)'

    render 'index'
  end

  def see_user_listings
    listing = Listing.find(params[:id])
    user = User.find(listing.user.id)

    @listings = Listing.where(user: user, status: 'available')
    @title = "Surfboard Listings by #{user.first_name}"
    @descriptive_line1 = 'Find a board below that you want to check out!'
    @descriptive_line2 = '(Some boards are part of a multi-item swap only)'

    render 'index'
  end

  def new
    # before_action identify_boards
    # before_action preload_addresses
    @listing = Listing.new
    @boards = current_user.boards.where.not(status: 'Swap Agreed')
  end

  def create
    # before_action identify_boards
    # before_action preload_addresses

    params_hash = listing_params
    params_hash[:user] = current_user
    # separated lines as adding :user value to listing_params does not work
    @listing = Listing.new(params_hash)
    @addresses = Address.all

    if @listing.valid?
      @listing.save

      # status is set to available to stop Listings with Meetups appearing
      @listing.update!(status: 'available')

      # updating the status of boards to listed, to allow more precise queries elsewhere
      @listing.boards.each do |board|
        board.update!(status: 'currently_listed')
      end

      redirect_to listings_path

    else
      flash.now[:errors] = @listing.errors.messages.values.flatten
      render :new

    end
  end

  def update
    # before_action identify_listing
    # before_action preload_addresses

    @listing.update!(listing_params)

    @listing.offers.each do |offer|
      offer.destroy!
      # remove all offers, send notification
    end
    redirect_to @listing

  rescue StandardError
    flash.now[:errors] = @listing.errors.messages.values.flatten
    render :edit
  end

  def edit
    # before_action identify_listing
    # before_action preload_addresses
    @boards = current_user.boards.where.not(status: 'Swap Agreed')
  end

  def destroy
    # before_action identify_listing
    # Meetups and Offers are have a dependency destroy constraint
    @listing.destroy!
    # send a message to other users
    redirect_to listings_path
  end

  def show
    # before_action identify_listing
    @host = User.find(@listing.user_id)

    @item_count = @listing.boards.count
    @offer_count = @listing.offers.count

    # using the FormatTimedate module
    @date = formatted_date(@listing.meetup_date)
    @time = formatted_time(@listing.meetup_time)

    @available_board_count = count_available_boards
  end

  ##################### PRIVATE #####################################
  private

  def listing_params
    params.require(:listing).permit(:user_id, :header, :status, :meetup_date, :meetup_time, :address_id, :comment,
                                    :created_at, board_ids: [])
    # params.require(:board).permit(:cover_image, :title, :publisher, :data_published, :author_id, genre_ids: [])
  end

  def identify_listing
    @listing = Listing.find(params[:id])
  end

  def identify_boards
    @boards = Board.where(user: current_user)
  end

  def preload_addresses
    @addresses = Address.all
  end

  def check_if_authorised
    # using pundit, check the permissions
    authorize @listing || Listing
  end

  def check_availability_prior_listing
    unless count_available_boards.positive?
      flash[:notice] = 'Sorry, you have no available boards to create a new listing'

      redirect_to(request.referrer || root_path)
      # return to previous URL or to home page
    end
  end

  def count_available_boards
    available_boards = current_user.boards.select(:status).where.not(status: 'Swap Agreed')
    if available_boards.nil?
      0
    else 
      available_boards.count
    end
  end
  

end
