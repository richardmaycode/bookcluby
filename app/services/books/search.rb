module Books
  class Search < ApplicationService
    def initialize(search)
      @search = search
    end

    def call
      books = book_search
      return unless books&.dig(:docs).present?

      process_results(books)
    end

    private

    def book_search
      search_param = @search.parameterize(separator: '+')
      query_url = "http://openlibrary.org/search.json?title=#{search_param}"

      response = HTTParty.get(query_url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def process_results(books)
      books_array = []
      books[:docs][0, 5].each do |book|
        book_hash = {}
        next unless book[:isbn].present? && book[:author_name].present?

        book_hash[:isbn] = book[:isbn]&.first
        book_hash[:title] = book[:title]
        book_hash[:author] = book[:author_name]&.join(', ')
        book_hash[:cover_id] = book[:cover_i]
        books_array << book_hash
      end
      books_array
    end
  end
end
