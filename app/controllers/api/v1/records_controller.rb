class Api::V1::RecordsController < ApplicationController
  def index
    response.headers['Access-Control-Allow-Origin'] = '*'
    render json: Record.where(name: /#{params[:query]}/i).limit(6).to_a unless params[:query].empty?
  end

  def create
    record = Record.new(record_params)
    if record.save
      render json: record
    else
      render json: {
        status: 400,
        message: record.errors.messages
      }, :status => 400
    end
  end
  
  def destroy
    record = Record.find(params[:id])
    record.destroy
    head :no_content  
  end

  def update
    record = Record.find(params[:id])
    if record.update(record_params)
      render json: {
        status: 202,
        message: "Record Updated",
        record: record
      }, status: 202
    else
      render json: {
        status: 400,
        message: record.errors.messages
      }, status: 400
    end
  end
  
  private
    def record_params
      params.require(:record).permit(:name, :object, :local_id, :uri, :slug)
    end
end