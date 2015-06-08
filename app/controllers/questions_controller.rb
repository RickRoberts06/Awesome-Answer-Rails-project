class QuestionsController < ApplicationController
    before_action :find_question, only: [:edit, :update, :destroy, :show]

    def index
      @questions = Question.page(params[:page]).per(10)
    end


    def new
      #this will render app/views/questions/new.html.erb (by converting)
      @question = Question.new
    end

    def create
      question_params = params.require(:question).permit([:title, :body])
      @question        = Question.new(question_params)
      #this is just to show on the page the params we get from the user
      #for testing purposes
      #render text: params[:question]

      #The question.save will return true if it passes validation and saves
      #correctly to the database. Otherwise it will give the message "False"
      if @question.save
        render text: "Success"
      else
        #this will render "new.html.erb" inside of "/view/questions/" folder
        render :new
      end
    end

      #you access this action by visiting /question/:id
      #where :id is the id of the question we'd like to display
    def show
      @question = Question.find params[:id]
    end

    def edit
      @question = Question.find params[:id]
    end

    def update
      @question = Question.find params[:id]
      question_params = params.require(:question).permit([:title, :body])
      @question.update(question_params)

      if @question.update(question_params)
        redirect_to question_path(@question), notice: "Question updated"
      else

        render :edit
      end
    end

    def destroy
      @question = Question.find params[:id]
      @question.destroy
      redirect_to question_path(@question), notice: "Question destroyed"
    end


    private

    def find_question
      @question = Question.find params[:id]
    end

end
