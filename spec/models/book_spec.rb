require 'rails_helper'

RSpec.describe Book do

  describe 'associations' do
    it {should belong_to :author }
  end

  describe 'class methods' do
    describe '#sorts_title_alphabetically' do
      it 'sort by title' do
        author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
        book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: true)
        book2 = author.books.create!(title: "Wild wild west", pages: 400, awards: true)
        book3 = author.books.create!(title: "Memphis vibes", pages: 400, awards: true)

        expected = [book1, book3, book2]
        expect(Book.sorts_title_alphabetically).to eq(expected)
      end
    end
  end
end
