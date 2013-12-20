class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy, :vote, :lockdown, :invitations, :send_invitations]
  before_filter :authenticate_user!, :except => [:index, :show, :vote]

  NUMBER_OF_BUILT_ENTRIES = 2
  NUMBER_OF_BUILT_RECIPIENTS = 1

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
    end
  end

  def vote
    @poll.build_scores(params[:entries])

    respond_to do |format|
      flash[:notice] = "Voting successful!"
      format.json { render json: { :path => poll_path(@poll) } }
    end
  end

  def lockdown

    respond_to do |format|

      if @poll.lock
        format.html{ redirect_to @poll, notice: "Poll locked!" }
      else
        format.html{ redirect_to edit_poll_path, notice: "Poll unlocked!" }
      end

    end

  end

  def invitations
    NUMBER_OF_BUILT_RECIPIENTS.times{ @poll.recipients.build }
  end

  def send_invitations

    respond_to do |format|

      if @poll.update(poll_params)
          @poll.invite_recipients
          format.html { redirect_to @poll, :notice => "Invitations sent!" }
      else
          format.html { render :action => "invitations", :notice => "There was an error!" }
      end

    end

  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:name, entries_attributes: [:id, :name, :_destroy], recipients_attributes: [:id, :email, :_destroy] )
  end

end
