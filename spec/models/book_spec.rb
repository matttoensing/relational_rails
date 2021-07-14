require 'rails_helper'

RSpec.describe Book do

  describe 'associations' do
    it {should belong_to :author }
  end

  describe 'class methods' do
    describe '#sorts_title_alphabetically' do
      it 'sort by title' do
        author = Author.create!(name: "Edward Abbey", published: true, age: 35)
        book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: true)
        book2 = author.books.create!(title: "Wild wild west", pages: 400, awards: true)
        book3 = author.books.create!(title: "Memphis vibes", pages: 400, awards: true)

        expected = [book1, book3, book2]
        expect(Book.sorts_title_alphabetically).to eq(expected)
      end
    end

    describe '#books_over_page_length' do
      it 'can show only books over a certain length' do
        author = Author.create!(name: "Edward Abbey", published: true, age: 35)
        book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: true)
        book2 = author.books.create!(title: "Wild wild west", pages: 400, awards: true)
        book3 = author.books.create!(title: "Memphis vibes", pages: 200, awards: true)

        expected = [book1, book2]

        expect(Book.books_over_page_length(300)).to eq(expected)
        expect(Book.books_over_page_length(450)).to eq([book1])
      end
    end

    describe '#show_true_awards' do
      it 'will only show books with awards' do
        author = Author.create!(name: "Edward Abbey", published: true, age: 35)
        book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: false)
        book2 = author.books.create!(title: "Wild wild west", pages: 400, awards: true)
        book3 = author.books.create!(title: "Memphis vibes", pages: 200, awards: true)

        expected = [book2, book3]

        expect(Book.show_true_awards).to eq(expected)
      end
    end
  end
end
