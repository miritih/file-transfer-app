class MediaFilesController < ApplicationController
  before_action :media_types, only: [:index]
  before_action :authenticate_user!
  layout "dashboard"

  def index
    @files=[]
    MediaFile.where(user_id: current_user.id).order(created_at: :desc).each do |media_file|
      if media_file.files.attached?
        media_file.files.each{ |file| @files.push(file) }
      end
    end
    @files
  end

  # GET /media_files/new
  def new
    @media_file = MediaFile.new
  end

  def create
    @media_file = MediaFile.new(media_file_params)
    respond_to do |format|
      if @media_file.save
        format.html do
          redirect_to root_path, notice: 'Files were successfully Uploaded.'
        end
      else
        format.html { render :new }
        format.json do
          render json: root_path.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    ActiveStorage::Attachment.find(params[:id]).purge
    respond_to do |format|
      format.html do
        redirect_to media_files_url,
                    notice: 'File was successfully Deleted.'
      end
      format.json { head :no_content }
    end
  end
  private

  def media_types
    @media_types = {
      'audio/aac' => 'fa fa-file-audio-o',
      'video/x-msvideo' => 'fa fa-file-video-o',
      'application/vnd.amazon.ebook' => 'fa fa-book-o',
      'image/bmp' => 'fa fa-file-image-o',
      'application/x-bzip' => 'fa fa-file-archive-o',
      'application/x-bzip2' => 'fa fa-file-archive-o',
      'text/css' => 'fa fa-file-code-o',
      'text/csv' => 'fa fa-file-code-o',
      'application/msword' => 'fa fa-file-word-o',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document' => 'fa fa-file-word-o',
      'application/epub+zip' => 'fa fa-file-archive-o',
      'image/gif' => 'fa fa-file-image-o',
      'text/html' => 'fa fa-file-code-o',
      'application/json' => 'fa fa-file-code-o',
      'image/vnd.microsoft.icon' => 'fa fa-file-word-o',
      'application/java-archive' => 'fa fa-file-archive-o',
      'image/jpeg' => 'fa fa-file-image-o',
      'audio/mpeg' => 'fa fa-file-audio-o',
      'video/mpeg' => 'fa fa-file-video-o',
      'audio/ogg' => 'fa fa-file-audio-o',
      'video/ogg' => 'fa fa-file-video-o',
      'image/png' => 'fa fa-file-image-o',
      'application/pdf' => 'fa fa-file-pdf-o',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' => 'fa fa-file-excel-o',
      'application/vnd.ms-excel' => 'fa fa-file-excel-o',
      'application/vnd.ms-powerpoint' => 'fa fa-file-powerpoint-o',
      'application/vnd.openxmlformats-officedocument.presentationml.presentation' => 'fa fa-file-powerpoint-o',
      'application/x-rar-compressed' => 'fa fa-file-archive-o',
      'application/x-tar' => 'fa fa-file-archive-o',
      'text/plain' => 'fa fa-file',
      'audio/wav' => 'fa fa-file-video-o',
      'audio/webm' => 'fa fa-file-video-o',
      'video/webm' => 'fa fa-file-video-o',
      'image/webp' => 'fa fa-file-video-o',
      'font/woff' => 'fa fa-file-video-o',
      'font/woff2' => 'fa fa-file-video-o',
      'application/zip' => 'fa fa-file-archive-o',
      'application/x-php' => 'fa fa-file-code-o',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' => 'fa fa-file-code-o',
    }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def media_file_params
    params.require(:media_file).permit(:name, files: []).merge({
      user_id: current_user.id,
    })
  end
end
