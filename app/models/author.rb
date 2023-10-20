class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors
	validates :first_name, presence:true, length: {minimum: 3, maximum:20}
	validates :last_name, presence:true, length: {minimum: 3, maximum:20}
	 validate :date_of_birth_greater_than_10_years_ago

  def date_of_birth_greater_than_10_years_ago
    if date_of_birth.present? && date_of_birth > 10.years.ago.to_date
      errors.add(:date_of_birth, "must be greater than 10 years ago")
    end
  end
end
