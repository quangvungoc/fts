class AnswerSheetsController < ApplicationController
  before_action :signed_in_user

  def new
    @answer_sheet = AnswerSheet.new
  end

  def create
    @answer_sheet = current_user.answer_sheets.build(answer_sheet_params)
    if @answer_sheet.save
      redirect_to current_user
    else
    end
  end

  def show
    @answer_sheet = AnswerSheet.find params[:id]
    @answer_sheet_details = @answer_sheet.answer_sheet_details
    @readonly = true
  end

  def edit

  end

  def update
  end

  def index
    @answer_sheets = User.find(params[:user_id]).answer_sheets
  end

  private
    def answer_sheet_params
      params.require(:answer_sheet).permit(:subject_id, :exam_id)
    end
end
