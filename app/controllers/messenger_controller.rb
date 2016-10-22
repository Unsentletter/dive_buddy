class MessengerController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messengers = @conversation.messengers
    if @messengers.length > 10
      @over_ten = true
      @messengers = @messengers[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messengers = @conversation.messengers
    end
    if @messengers.last
      if @messengers.last.user_id != current_user.id
        @messengers.last.read = true;
      end
    end

    @messenger = @conversation.messengers.new
  end

  def new
    # @messenger = @conversation.messengers.build
  end

  def create

    @messenger = @conversation.messengers.create(messenger_params)
    @messenger.save
      redirect_to conversation_messenger_index_path(@conversation)
    # end
  end

private
  def messenger_params
    params.require(:messenger).permit(:body,:user_id,:read,:conversation_id)
  end
end
