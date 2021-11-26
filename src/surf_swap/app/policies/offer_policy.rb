# frozen_string_literal: true

class OfferPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @offer = record
  end


  def reject_offer?
    # true if you are the listing host
    @offer.listing.user.id == @user.id
  end

  def reset_offer?
     # true if you are the listing host
     @offer.listing.user.id == @user.id
  end

  def create?
    # this is authenticated, so every registered person can create an offer
    true
  end

  def new?
    create?
  end

  def update?
    @offer.user.id == @user.id
  end

  def edit?
    update?
  end

  def destroy?
    @offer.user.id == @user.id
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
