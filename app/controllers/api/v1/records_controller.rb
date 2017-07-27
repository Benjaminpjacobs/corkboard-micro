class Api::V1::RecordsController < ApplicationController
  def index
    render json: Record.all
  end
end