class QuestionsController < ApplicationController
  def index
    @questions = Question.paginate page: params[:page], order: "created_at DESC"
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create question_params
    if @question.save
      flash.now[:success] = "Question created successfully"
      render 'new'
    else
      render 'new'
    end
  end
  
  private
  def question_params
    params.require(:question).permit(:subject_id, :question_type, :content, answers_attributes:[:content, :correct_answer])
  end
end
