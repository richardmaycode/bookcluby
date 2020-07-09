require 'rest-client'

module Books
  class Search < ApplicationService
    def initialize(search)
      @search = search
    end

    def call
      base_url = 'http://openlibrary.org/search.json?title='
      search_param = @search.parameterize(separator: '+')
      query_url = base_url + search_param

      response = RestClient.get query_url
      response_clean = JSON.parse(response.body)

      results_array = []
      if response_clean['num_found'].to_i > 0
        count = 0
        response_clean['docs'].each do |r|
          break if count >=6
          book_hash = {}
          if r['isbn'].nil? or r['author_name'].nil?
            return
          else
            book_hash[:isbn] = r['isbn'][0]
            book_hash[:title] = r['title']
            book_hash[:author] = r['author_name'][0]
            book_hash[:cover_id] = r['cover_i']
          end
          results_array << book_hash unless book_hash.empty?
          count += 1
          
        end
      end
      return results_array
    end
  end
end