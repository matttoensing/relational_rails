require 'rails_helper'

RSpec.describe Author do
  describe 'associations' do
    it {should have_many :books}
  end

  describe 'class methods' do
    describe '#order_by_creation_time' do
      it 'orders authors by creation time' do
        Author.destroy_all
        Book.destroy_all

        author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63, created_at: 10.seconds.ago)
        author2 = Author.create!(name: 'Malcom Gladwell', published: true, age: 57, created_at: 36.seconds.ago)
        author3 = Author.create!(name: 'Michael Lewis', published: true, age: 48, created_at: 48.seconds.ago)

        expect(Author.order_by_creation_time.to_a).to eq([author1, author2, author3])
      end
    end

    describe '#order_by_number_of_books' do
      it 'orders authors by number of books from highest to lowest' do
        Author.destroy_all
        author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63, created_at: 10.seconds.ago)
        author2 = Author.create!(name: 'Malcom Gladwell', published: true, age: 57, created_at: 36.seconds.ago)
        author3 = Author.create!(name: 'Michael Lewis', published: true, age: 48, created_at: 48.seconds.ago)
        book1 = author2.books.create!(title: "Game of Rails", pages: 400, awards: true)
        book2 = author2.books.create!(title: "Ruby on Thrones", pages: 562, awards: true)
        book3 = author2.books.create!(title: "Havasu Tour Guide", pages: 125, awards: true)
        book4 = author3.books.create!(title: "Game of Fails", pages: 400, awards: true)
        book5 = author3.books.create!(title: "Ruby on Ales", pages: 562, awards: true)
        book6 = author1.books.create!(title: "Grand Canyon Tour Guide", pages: 125, awards: true)

        expected = [author2, author3, author1]

        expect(Author.order_by_number_of_books).to eq(expected)
      end
    end

    describe 'instance methods' do
      describe '#number_of_books' do
        it 'count the number of books for a given author' do
          Author.destroy_all

          author = Author.create!(name: 'Michael Lewis', published: true, age: 48, created_at: 48.seconds.ago)
          book1 = author.books.create!(title: "Game of Rails", pages: 400, awards: true)
          book2 = author.books.create!(title: "Ruby on Thrones", pages: 562, awards: true)
          book3 = author.books.create!(title: "Havasu Tour Guide", pages: 125, awards: true)
          expect(author.number_of_books).to eq(3)
        end
      end
    end
  end
end
