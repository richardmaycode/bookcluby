module Books
  class GetDetail < ApplicationService
    def initialize(indentifier)
      @indentifier = indentifier
    end

    def call
      query_url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{@indentifier}&jscmd=data&format=json"
      response = HTTParty.get(query_url)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      book_data = parsed_response[:"ISBN:#{@indentifier}"]
      Book.new(title: book_data[:title], author: book_data[:authors][0][:name], pages: book_data[:number_of_pages].to_i, book_cover: book_data[:cover][:medium], isbn: @indentifier)
      # [:cover][:medium]
      # [:idenentifiers][:amazon][0]
    end
  end
end
