class Api::V1::UploadsController < ApiController

  def index
    @uploads = Upload.all
    render_success @uploads.to_json
  end

  def create
    @upload = Upload.new upload_params
    if @upload.save
      render_success @upload.to_json
    else
      render_error_with_full_messages @upload
    end
  end

  def import
    @upload = Upload.find params[:id]
    count = ::ProductIngestion.read_excel(@upload.file)
    if count
      render_success({message: "You imported #{count} products successfully."})
    else
      render_error({message: "Failed to import products with file."})
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:file, :description)
  end

end