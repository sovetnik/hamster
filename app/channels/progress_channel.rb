class ProgressChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'progress'
  end
end
