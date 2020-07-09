require 'rails_helper'

RSpec.describe "BookSearches", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/book_searches/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/book_searches/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/book_searches/create"
      expect(response).to have_http_status(:success)
    end
  end

end
