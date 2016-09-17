class DeliveryMailer < ApplicationMailer
  def personal_email(num)
    @addressee = Addressee.new num
    @message = Message.from_redis
    check_progress
    attachments.inline[@message.image] = File.read(@message.image_path)
    mail(to: @addressee.email, subject: @message.head)
  end

  def check_progress
    sent_count = redis.incr(:sent_count)
    last_progress = redis.get(:progress).to_i
    current_progress = (sent_count * 100) / Addressee.count
    save_progress(current_progress) if last_progress < current_progress
  end

  def save_progress(progress)
    redis.set :progress, progress
    broadcast progress
  end

  def broadcast(progress)
    completed = redis.get(:sent_count).to_i == Addressee.count
    ActionCable.server.broadcast 'progress',
      rate: "#{progress}%",
      completed: completed
  end

  def redis
    @redis ||= Redis.new
  end
end
