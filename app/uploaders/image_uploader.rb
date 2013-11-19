# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWaveDirect::Uploader

  # Include Sprockets helpers for asset pipeline compatability:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  include CarrierWave::MimeTypes
  process :set_content_type

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_limit => [300, 300]
  end

end
