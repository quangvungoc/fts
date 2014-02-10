class ExamsController < ApplicationController
  def index 

    if params[:subject_id].nil?
      @exams = Exam.all
    else
      @exams = Subject.find(params[:subject_id]).exams
    end

    respond_to do |format|
      format.html
      format.json {render json: @exams}
    end
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new exam_params
    if @exam.save 
      flash.now[:success] = "Exam form crated successfully"
      render 'new'
    else
      render 'new'
    end
  end

  private
  def exam_params
    params.require(:exam).permit(:subject_id, :name, :duration)
  end
end
