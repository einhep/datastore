# coding: utf-8
class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    unless request.get?
      name = uploadfile(@upload.file_url)
      puts "*******88"
      puts name
      @upload.file_url = name
      @upload.save
    end
    redirect_to user_path
  end

  protected
  def uploadfile(file)
    if !file.original_filename.empty?
      @filename = file.original_filename
      #设置目录路径，如果目录不存在，生成新目录
      FileUtils.mkdir("#{Rails.root}/public/upload") unless File.exist?("#{Rails.root}/public/upload")
      #写入文件
      ##wb 表示通过二进制方式写，可以保证文件不损坏
      File.open("#{Rails.root}/public/upload/#{@filename}", "wb") do |f|
        f.write(file.read)
      end
      return @filename
    end
  end
  private

  def upload_params
    params.require(:upload).permit(:name,:description,:file_url)
  end
end
