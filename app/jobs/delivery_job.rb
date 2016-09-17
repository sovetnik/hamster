class DeliveryJob < ApplicationJob
  queue_as :default

  def perform
    redis = Redis.new
    redis.set(:progress, 0)
    redis.set(:sent_count, 0)
    (1..Addressee.count).each do |num|
      DeliveryMailer.personal_email(num).deliver_later
    end
  end
end
