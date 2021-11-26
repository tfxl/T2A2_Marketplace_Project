# frozen_string_literal: true

class BoardPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @board = record
  end

  def index?
   # permission based on current_user parameters
    true
  end

  def my_listings?
    # permission based on current_user parameters
    true
  end

  def user_listings?
    # permission based on current_user parameters, although it is simply a refined index anyways, which is open access
    true
  end

  def create?
    # permission based on current_user parameters
    true
  end

  def new?
    create?
  end

  def update?
    @board.user.id == @user.id
  end

  def edit?
    update?
  end

  def destroy?
    @board.user.id == @user.id
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
