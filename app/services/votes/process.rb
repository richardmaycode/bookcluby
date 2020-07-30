module Votes
  class Process < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      puts @params[:vote]
      Vote.find_or_create_by(user_id: @params[:vote][:user_id])
      # vote = Vote.find_or_create_by(user_id: @params[:vote][:user_id], recommendation_id: @params[:vote][:voting_session_recommendation_id], outcome: @params[:vote][:outcome] )

    end
  end
  
end