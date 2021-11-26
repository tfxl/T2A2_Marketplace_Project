class PagesController < ApplicationController

  def index
    unless current_user.nil?
      count_meetups
    end
  end

  def inbox
    flash[:notice] = "Inbox is a Premium Feature Only! Available Soon"
    redirect_to(request.referrer || root_path)
  end

  private

  def count_meetups
    # meetups via offers (mvo) + meetups via listings (mvl)
    mvo  = current_user.offers.where(status: "accepted").count
    mvl = current_user.meetups.count
    @meetup_count = mvo + mvl
  end

end
