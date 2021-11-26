# frozen_string_literal: true

class MeetupPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @meetup = record
  end

  def index?
    true
    # (@meetup.listing.user.id == @user.id) || (@meetup.offer.user.id == @user.id)
  end

  def host_cancels?
    @meetup.listing.user.id == @user.id
  end

  # this can only be actioned by responder
  def responder_cancels?
    @meetup.offer.user_id == @user.id
  end

  def swap_completed?
    # only the host has the power to confirm if a swap is completed
    @meetup.listing.user.id == @user.id
  end

  def show?; end # none implemented


  def create?
    # only the host of the listing can create
    # this is a CASE SPECIFIC use where @meetup will actually hold the associated offer
    # thus, allow if host of offer (also host of meetup)
    @meetup.listing.user.id == @user.id
  end

  def new?
    create?
  end

  def update?
    false
     # no update feature exists at this stage, just completed or cancelled
  end

  def edit?
    update?
  end

  def destroy?
    (@meetup.listing.user.id == @user.id) || (@meetup.offer.user.id == @user.id)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
