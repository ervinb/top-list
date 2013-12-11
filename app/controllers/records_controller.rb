class RecordsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_record, :only => [:destroy]

  def create
    @poll = Poll.find(params[:poll_id])
    @record = @poll.records.build(:name => params[:record][:record][:name])

    respond_to do |format|

      if @poll.save
        format.html {redirect_to @poll, notice: 'Record was added'}
        format.js
        format.json { render json: @record }
      else
        format.html {redirect_to poll_edit_path @poll, notice: "Failed to save the record"}
      end

    end

  end

  def destroy
  end

  private
    def record_params
      params.require(:record).permit(:record, :poll_id)
    end

    def set_record
      @record = Record.find(params[:id])
    end
end
