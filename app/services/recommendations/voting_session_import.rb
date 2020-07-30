module Recommendations
  class VotingSessionImport < ApplicationService
    def initialize(voting_session)
      @voting_session = voting_session
      @group = voting_session.group
    end

    def call
      return unless @group.recommendations.eligible.any?

      add_recommendations_to_session(@group.recommendations.eligible)
    end

    def add_recommendations_to_session(recommendations)
      recommendations.each do |r|
        VotingSessionRecommendation.create(voting_session_id: @voting_session.id, recommendation_id: r.id)
      end
    end
  end
end
