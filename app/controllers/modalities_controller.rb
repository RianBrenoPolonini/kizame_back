# frozen_string_literal: true

class ModalitiesController < ApplicationController
  before_action :set_modality, only: %i[show update destroy]

  # GET /modalities
  # GET /modalities.json
  def index
    @modalities = Modality.all
  end

  # GET /modalities/1
  # GET /modalities/1.json
  def show; end

  # POST /modalities
  # POST /modalities.json
  def create
    @modality = Modality.new(modality_params)

    if @modality.save
      render(:show, status: :created, location: @modality)
    else
      render(json: @modality.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /modalities/1
  # PATCH/PUT /modalities/1.json
  def update
    if @modality.update(modality_params)
      render(:show, status: :ok, location: @modality)
    else
      render(json: @modality.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /modalities/1
  # DELETE /modalities/1.json
  def destroy
    @modality.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_modality
    @modality = Modality.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def modality_params
    params.require(:modality).permit(:name)
  end
end
