class UploadsController < ApplicationController
  before_action :set_user
  before_action :set_upload, only: [:show, :edit, :update]

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.user_id = @current_user.id

    if @upload.save
      flash[:notice] = 'File(s) uploaded'
      redirect_to user_uploads_path
    else
      flash[:notice] = 'Issue uploading file(s)'
      render 'new'
    end
  end

  def index
    @uploads = @current_user.uploads.all
  end

  def show
  end

  def edit
  end

  def update
    if @current_upload.update(upload_params)
      redirect_to user_uploads_path
    else
      render 'edit'
    end
  end

  def destroy
  end

private

  def upload_params
    params.require(:upload).permit(:name, :imported, :notes, files: [])
  end

  def set_user
    @current_user = User.find(params[:user_id])
  end

  def set_upload
    @current_upload = Upload.find(params[:id])
  end

end
