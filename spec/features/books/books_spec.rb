require 'rails_helper'

RSpec.feature "Books", type: :feature do
  feature 'Create' do
    before do
      create(:user)
      visit new_book_path
    end
    scenario 'with valid inputs' do 
      fill_in 'book_title', with: Faker::Book.title
      fill_in 'book_author', with: Faker::Book.author
      fill_in 'book_pages', with: 75
      fill_in 'book_genre', with: 'Fantasy'
      fill_in 'book_description', with: Faker::Lorem.paragraph(sentence_count: 20)
      click_on 'Submit'

      expect(page).to have_content('Book')
    end

    scenario 'with invalid inputs' do
      click_on 'Submit'
      expect(page).to have_content('Create Book')
    end
  end
  feature 'Edit' do
    before do
      create(:book)
      visit edit_book_path(Book.last)
    end
    scenario 'with valid inputs' do
      fill_in 'book_title', with: Faker::Book.title
      expect(page).to have_content('Book')
    end
  end
end
