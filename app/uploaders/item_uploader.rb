# encoding: utf-8

class ItemUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :original do
    process :store_best_geometry
  end

  # Create different versions of your uploaded files:
  version :tiny_thumb do
     process :resize_to_limit => [125, 93]
  end

  version :thumb do
    process :resize_to_limit => [240,180]
  end

  version :mid do
    process :resize_to_limit => [350, 262]
  end

  version :full do
    process :resize_to_limit => [1100,900]
  end
        
  def store_best_geometry
    manipulate! do |img|
      if model
        model.width = img.rows
        model.height = img.columns
      end
      img = yield(img) if block_given?
      img
    end
  end

  def tiny_thumb_needed?(new_file)
    if (new_file)
      img = ::Magick::Image::read(new_file)
      return img.columns > 125 && img.rows > 93
    end
    
  end

  # resizes an image, while preserving the original aspect ratio,
  # such that the new height is `height'. The values for the first parameters in the calls to `resize_to_fit' are
  # just upper-bounds to ensure that the image is filled completely in the vertical direction.
  def resize_to_height(height)
    manipulate! do |img|
      if img.rows >= height
        # here we're sizing down, so the new width cannot be more than img.columns
        img.resize_to_fit!(img.columns, height)
      else
        # should rarely be called; here we're sizing up, so if we scale the height by height.fo_f / img.rows, then the new width
        # can't be more than 2 * (img.columns * (height.to_f / img.rows)).ceil, since aspect the aspect ratio is preserved. (The 2
        # is unncessary, and is just there to be safe ;)
        img.resize_to_fit!(2 * (img.columns * height.to_f / img.rows).ceil, height)
      end
      img = yield(img) if block_given?
      img
    end
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
