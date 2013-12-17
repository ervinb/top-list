class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy, :vote]
  before_filter :authenticate_user!, :except => [:index, :show, :vote]

  NUMBER_OF_BUILT_ENTRIES = 2

  def index
    @polls = Poll.all
  end

  def show
  end

  def new
    @poll = Poll.new
    NUMBER_OF_BUILT_ENTRIES.times{ @poll.entries.build }
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
    entry_ids = params[:entries]
    build_scores(entry_ids)

    respond_to do |format|
      flash[:notice] = "Voting successful!"
      format.json { render json: { :path => poll_path(@poll) } }
    end

  end

  private

    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:name, entries_attributes: [:id, :name, :_destroy] )
    end

    def build_scores(entry_ids)

      entry_ids.each_with_index do |entry_id, index|
        entry = @poll.entries.find(entry_id)
        entry.scores.build(:score => index)
        entry.save
      end

    end

end
