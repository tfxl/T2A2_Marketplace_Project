# frozen_string_literal: true

class ListingPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @listing = record
  end

  def index?
    # true for all
    true
  end

  def my_listings
    true
  end

  def see_user_listings
    true
  end

  def show?
    # true for all who are registered, so authenticate parameters
    true
  end

  def create?
    # true for all who are registered, so authenticate parameters
    true
  end

  def new?
    create?
  end

  def update?
    edit?
  end

  def edit?
    @listing.user.id == @user.id
  end

  def destroy?
    @listing.user.id == @user.id
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
