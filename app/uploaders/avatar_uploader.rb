# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # 定义上传到哪个文件夹
  def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    'public/user/upload/directory'
  end

  #def filename
  #	"#{model.id}.png"
  #end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # 可以定义默认图片，如果用户没有上传图片，则可以使用默认的图片
  def default_url
  	"avatar/#{version_name}_default.png"
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #  "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end
  # 转换成 png
  #process :convert => 'png'
  # 按比例缩成指定大小并且补白
  #process :resize_to_fit => [800,800]
  # 图片的处理，有不同版本的大小，网站可以在不同的地方调用不同的版本
  version :normal do
	process :resize_to_fill =>[48,48]
  end

  version :small do
	process :resize_to_fill =>[32,32]
  end

  version :large do
	process :resize_to_fill =>[64,64]
  end

  version :big do
	process :resize_to_fill =>[100,100]
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # 指定上传文件的格式
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
