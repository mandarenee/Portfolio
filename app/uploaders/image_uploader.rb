# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader

  include CarrierWave::RMagick

  include Sprockets::Rails::Helper

  # Include RMagick or MiniMagick support:
  # include CarrierWave::MiniMagick

  process :set_content_type

  process resize_to_fit: [800, 800]

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
