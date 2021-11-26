class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[edit show destroy update]
  before_action :check_if_authorised

  def index
    @boards = Board.where(user: current_user)
    @board_count = @boards.count
  end

  def new
    @board = Board.new
  end

  def create
    # first line required, separated user and status
    updated_params = board_params
    updated_params[:user] = current_user
    updated_params[:status] = 'Available'
    @board = Board.new(updated_params)

    if @board.valid?
      @board.save
      redirect_to boards_path

    else
      flash.now[:errors] = @board.errors.messages.values.flatten
      render :new

    end
  end

  def edit
    # function, set_board() is before_actioned, and will find board by id (using params[:id])
    # edit view is defaulted, which will render the _form partial

    unless @board.listings.length == 0
      @board.listings.each do |listing|  # optionally just destroy the offers, and optionally put in the update method
        listing.destroy!
      end
    end
  end

  def update
    # function, set_board() is before_actioned, and will find board by id (using params[:id])
    begin
      @board.update!(board_params)
      redirect_to boards_path

    rescue StandardError
      flash.now[:errors] = @board.errors.messages.values.flatten
      render :edit

    end
  end

  def destroy
    # function, set_board() is before_actioned, and will find board by id (using params[:id])
    @board.destroy
    redirect_to boards_path
  end

  ################################ PRIVATE ##################################
  private

  def board_params
    params.require(:board).permit(:designer, :length, :width, :volume, :fins, :tail, :condition, :attachments, :description, :board_image)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def check_if_authorised
    # using pundit, check the permissions
    authorize @board || Board
  end

end
