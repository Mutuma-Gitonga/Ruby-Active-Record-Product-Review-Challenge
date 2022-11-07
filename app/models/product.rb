class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def leave_review(user:, star_rating:, comment:)
    self.reviews << Review.create(star_rating: star_rating, comment: comment, user_id: user.id)
  end

  def print_all_reviews
    self.reviews.count.times do |index|
      puts "Review for #{self.name} by #{self.users[index].name}: #{self.reviews[index].star_rating}. #{self.reviews[index].comment}" 
    end
  end

  def average_rating
    self.reviews.map { |rating| rating.star_rating }.sum.to_f / self.reviews.count
  end
end
