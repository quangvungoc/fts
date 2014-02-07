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
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  def update

  end
  
  def show
    @question = Question.find params[:id]
  end
  
  def destroy
    @question = Question.find params[:id]
    @subject = @question.subject
    @question.destroy
    redirect_to @subject
  end

  private
  def question_params
    params.require(:question).permit(:subject_id, :question_type, :content, answers_attributes:[:content, :correct_answer])
  end
end
