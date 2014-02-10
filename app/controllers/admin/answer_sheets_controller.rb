class Admin::AnswerSheetsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def edit
    @answer_sheet = AnswerSheet.find params[:id]
    @answer_sheet_details = @answer_sheet.answer_sheet_details
    @readonly = true
    @auto_marking = @answer_sheet.score.nil?

    if @answer_sheet.end_time.nil? || @answer_sheet.end_time > Time.now
      flash[:notice] = "This exam has not ended yet."
      redirect_to admin_answer_sheets_path
    end
  end

  def update
    @answer_sheet = AnswerSheet.find params[:id]
    if @answer_sheet.update_attributes answer_sheet_params
      flash[:success] = "Answer sheet successfully updated!"
    end
    redirect_to edit_admin_answer_sheet_path @answer_sheet
  end

  def index
    @answer_sheets = AnswerSheet.all
  end

  private
  def answer_sheet_params
    params.require(:answer_sheet).permit(:subject_id, 
      :exam_id, answer_sheet_details_attributes:[:id, :question_id, :correct])
  end

  def admin_user
    redirect_to root_url unless current_user.admin == 1
  end
end