class Addressee
  attr_reader :email, :name

  def self.count
    420
  end

  def initialize(name)
    @name = name
    @email = "#{name}@mailbox.com"
  end
end
