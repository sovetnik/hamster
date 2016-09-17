class MessageController < ApplicationController
  def new
  end

  def start
    @message = Message.new(
      head: params[:head],
      body: params[:body],
      image: image_name
    )
    @message.store!
    DeliveryJob.perform_later
    render :progress
  end

  def progress
  end

  private

  def image_name
    Attachment.new(params[:attachment]).to_image_name
  end
end
