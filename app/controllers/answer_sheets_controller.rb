class AnswerSheetsController < ApplicationController
  before_action :signed_in_user

  def new
    @answer_sheet = AnswerSheet.new
  end

  def create
    @answer_sheet = current_user.answer_sheets.build(answer_sheet_params)
    if @answer_sheet.save
      redirect_to user_answer_sheets_path current_user
    else
      flash.now[:error] = "Error!!!"
    end
  end

  def show
    @answer_sheet = AnswerSheet.find params[:id]
    @answer_sheet_details = @answer_sheet.answer_sheet_details
    @readonly = true
  end

  def edit
    @answer_sheet = AnswerSheet.find params[:id]

    if @answer_sheet.end_time.present? && @answer_sheet.end_time < Time.now 
      redirect_to user_answer_sheet_path(current_user, @answer_sheet)
    end

    if @answer_sheet.start_time.nil?
      @answer_sheet.update_attributes start_time: Time.now, end_time: (Time.now+60*@answer_sheet.exam.duration)
    end
  end

  def update
    @answer_sheet = AnswerSheet.find params[:id]
    if @answer_sheet.update_attributes answer_sheet_params
      flash[:success] = "Answer sheet successfully updated!"
    end
    redirect_to edit_user_answer_sheet_path(current_user, @answer_sheet)
  end

  def index
    @answer_sheets = User.find(params[:user_id]).answer_sheets
  end

  private
    def answer_sheet_params
      params.require(:answer_sheet).permit(:subject_id, :exam_id, answer_sheet_details_attributes:[:id, :answer, :question_id])
    end
end