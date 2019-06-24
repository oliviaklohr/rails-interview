# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    results = Question.not_private
                      .for_question_user(params[:user_id])
                      .for_answers(params[:question_id])
                      .for_answer_user
                      .for_question_query(params[:title])
    render json: results, status: :ok
  end
end
