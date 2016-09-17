class Attachment
  CONTENT_TYPES = %w( image/jpeg image/png ).freeze
  attr_reader :file

  def initialize(file)
    @file = file
    write_file if allowed?
  end

  def to_image_name
    allowed? ? file.original_filename : nil
  end

  private

  def write_file
    File.open(Rails.root.join('public', 'uploads', file.original_filename), 'wb') do |img|
      img.write(file.read)
    end
  end

  def allowed?
    CONTENT_TYPES.include? file.content_type
  end
end
