# frozen_string_literal: true

class ClassromsController < ApplicationController
  before_action :set_classrom, only: %i[show update destroy]
  before_action :authentication

  # GET /classroms
  def index
    @classroms = Classrom.all

    render(json: @classroms)
  end

  # GET /classroms/1
  def show
    render(json: @classrom)
  end

  # POST /classroms
  def create
    @classrom = @current_user.classrom.build(classrom_params)

    if @classrom.save
      render(json: @classrom, status: :created, location: @classrom)
    else
      render(json: @classrom.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /classroms/1
  def update
    if @classrom.update(classrom_params)
      render(json: @classrom)
    else
      render(json: @classrom.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /classroms/1
  def destroy
    @classrom.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_classrom
    @classrom = Classrom.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def classrom_params
    params.require(:classrom).permit(:name, :modality_id, :user_id, day: [], time: [])
  end
end
