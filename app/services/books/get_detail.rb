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
      puts book_data
      pages = book_data.key?(:number_of_pages) ? book_data[:number_of_pages].to_i : nil
      cover = book_data.key?(:cover) ? book_data[:cover][:medium] : nil
      Book.new(title: book_data[:title], author: book_data[:authors][0][:name], pages: pages, book_cover: cover, isbn: @indentifier)
      # [:cover][:medium]
      # [:idenentifiers][:amazon][0]
    end
  end
end

{:publishers=>[{:name=>"E-Penguin general"}], :title=>"Snow Crash", :url=>"https://openlibrary.org/books/OL27742444M/Snow_Crash", :identifiers=>{:isbn_13=>["9780141884813"], :amazon=>["0141884819"], :isbn_10=>["0141884819"], :openlibrary=>["OL27742444M"]}, :subject_places=>[{:url=>"https://openlibrary.org/subjects/place:future_america", :name=>"Future America"}], :subjects=>[{:url=>"https://openlibrary.org/subjects/american_science_fiction", :name=>"American Science fiction"}, {:url=>"https://openlibrary.org/subjects/open_library_staff_picks", :name=>"Open Library Staff Picks"}, {:url=>"https://openlibrary.org/subjects/ready_player_one", :name=>"ready player one"}, {:url=>"https://openlibrary.org/subjects/fiction", :name=>"Fiction"}, {:url=>"https://openlibrary.org/subjects/science_fiction", :name=>"Science fiction"}, {:url=>"https://openlibrary.org/subjects/suspense", :name=>"Suspense"}, {:url=>"https://openlibrary.org/subjects/open_syllabus_project", :name=>"open_syllabus_project"}, {:url=>"https://openlibrary.org/subjects/american_fiction", :name=>"American fiction"}], :publish_date=>"Jun 14, 2002", :key=>"/books/OL27742444M", :authors=>[{:url=>"https://openlibrary.org/authors/OL19430A/Neal_Stephenson", :name=>"Neal Stephenson"}], :subject_times=>[{:url=>"https://openlibrary.org/subjects/time:future", :name=>"Future"}]}