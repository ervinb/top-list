class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]

  NUMBER_OF_BUILT_RECORDS = 2

  def index
    @polls = Poll.all
  end

  def show
  end

  def new
    @poll = Poll.new
    NUMBER_OF_BUILT_RECORDS.times{ @poll.records.build }
  end

  def edit
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.user = current_user

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url }
      format.json { head :no_content }
    end
  end

  def vote
    debugger
    1+1
  end

  private
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:name, records_attributes: [:id, :name, :_destroy] )
    end
end
