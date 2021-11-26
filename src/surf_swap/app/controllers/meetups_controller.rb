class MeetupsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_offer, only: %i[create]
  before_action :identify_meetup_details, only: %i[host_cancels responder_cancels swap_completed destroy]
  before_action :check_if_authorised, except: :create

  include FormatTimedate # custom method in app/concerns

  def create
    authorize @this_offer
    # identify offer and listing for the meetup
    # before_action to identify offer
    @this_offer.update(status: 'accepted')

    @this_listing = Listing.find(@this_offer.listing_id)
    @this_listing.update(status: 'meetup_planned')

    # create the meetup with this information, however it is not yet completed
    Meetup.create!(listing_id: @this_listing.id, offer_id: @this_offer.id, completed: false)

    # go through the other offers for this listing and remove them
    @this_listing.offers.each do |offer|
      offer.destroy! unless offer == @this_offer
    end

    # remove any duplicate proposals (offers / listings) that the boards in this meetup are connected to
    remove_duplicate_board_proposals(@this_offer.boards)
    remove_duplicate_board_proposals(@this_listing.boards)

    # once all this is done, destroy the listing related to this meetup
    redirect_to meetups_path
  end

  def index
    relevant_listings = current_user.listings.map do |listing|
      listing.id
    end
    @hosted_meetups = Meetup.where(listing_id: relevant_listings)

    accepted_offers = current_user.offers.where(status: 'accepted').map do |offer|
      offer.id
    end
    @accepted_meetups = Meetup.where(offer_id: accepted_offers)
  end

  ##################### MEETUP OUTCOMES ###################################

  # this can only be actioned by host
  def host_cancels
    # before_action identify_meetup_details
    @meetup_listing.boards.each do |board|
      board.update!(status: "listed")
    end
    @meetup_offer.boards.each do |board|
      board.update!(status: "not listed")
    end
    # send notifications
    # destroy meetup and offer, but re-enable the listing status
    destroy
    @meetup_listing.update!(status: 'available')
    redirect_to root_path
  end

  # this can only be actioned by responder
  # the reason this function exists is so future different actions can be applied
  def responder_cancels
    # before_action identify_meetup_details
    @meetup_listing.boards.each do |board|
      board.update!(status: "listed")
    end
    @meetup_offer.boards.each do |board|
      board.update!(status: 'not listed')
    end
    # send notifications
    # destroy meetup and offer, but re-enable the listing status
    destroy
    @meetup_listing.update!(status: 'available')
    redirect_to root_path
  end

  def swap_completed
    identify_meetup_details
    @meetup[:completed] = true
    @swap_completed = @meetup.completed # stored as this value required after @meetup value deleted
    # Complete the surfboard trade
    meetup_board_transfer(@meetup_listing.boards.all, @meetup_offer.user.boards)
    meetup_board_transfer(@meetup_offer.boards.all, @meetup_listing.user.boards)
    # destroy the meetup and all meetup offer
    destroy
    # destroy the listing as well in this case, as swap has been completed, not cancelled
    @meetup_listing.destroy
    redirect_to root_path
  end

  def destroy
    # dependent: :destroy exists on the model Listing but was still required here
    @meetup.destroy!
    @meetup_offer.destroy!
    puts @swap_completed ? 'FIRST CONDITION' : 'SECOND CONDITION'
    @swap_completed ? @meetup_listing.destroy! : @meetup.listing.update![status: 'available']
  rescue StandardError => e
    puts '*' * 50
    puts 'Meetups Destroy Method not Completed'
    puts "Error: #{e.inspect}"
    puts '*' * 50
  end

  # ####################### PRIVATE METHODS ##################################
  private

  def identify_offer
    @this_offer = Offer.find(params[:id])
  end

  def identify_meetup_details
    @meetup = Meetup.find(params[:id])
    @meetup_listing = @meetup.listing
    @meetup_offer = @meetup.offer
  end

  def meetup_board_transfer(transfer_boards, receiver_collection)
    transfer_boards.each do |board|
      board.update!(status: 'Available')
      receiver_collection << board
    end
  end

  def remove_duplicate_board_proposals(board_group)
    # if the board has been accepted, then it shouldn't be in any other listings or offers
    board_group.each do |board|
      board.update!(status: 'Swap Agreed')
      remove_duplicate_offers(board)
      remove_duplicate_listings(board)
    end
  end

  def remove_duplicate_offers(board)
    board.offers.each do |offer|
      offer.destroy unless offer == @this_offer
      # notifications
    end
  end

  def remove_duplicate_listings(board)
    board.listings.each do |listing|
      # first remove all the offers from that listing
      next unless listing != @this_listing

      listing.offers.each do |offer|
        # notify others that the listing has been removed
        offer.destroy
      end
      listing.destroy!
    end
  end

  def check_if_authorised
    # using pundit, check the permissions
    authorize @meetup || Meetup
  end
end
