class Book < ApplicationRecord
	validates :title, presence:true, length: {minimum: 6, maximum:20}
end
