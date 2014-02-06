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

end
