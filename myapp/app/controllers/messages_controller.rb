class MessagesController < ApplicationController
    def index
      # Use the built-in with_attached_images scope to avoid N+1
      @messages = Message.all.with_attached_images
    end
  
    def create
      message = Message.create! params.require(:message).permit(:title, :content)
      message.images.attach(params[:message][:images])
      redirect_to message
    end
  
    def show
      @message = Message.find(params[:id])
    end
end
