class QuestionsController < ApplicationController
  def index
    @questions = current_user.questions
  end

  def show
    @question = current_user.questions.find(params[:id])
  end

  def new
    @question = current_user.questions.build
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def create
    @question = current_user.questions.build(params[:question])

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @question = current_user.questions.find(params[:id])

    if @question.update_attributes(params[:question])
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render action: "edit"
    end
  end
end
