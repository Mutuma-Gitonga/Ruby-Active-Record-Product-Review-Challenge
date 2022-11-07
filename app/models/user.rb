class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, through: :reviews

  def favorite_product
    product_with_highest_rating = 
    self.products.count.times.map do |index|
      self.products[index].reviews.map { |rating| rating.star_rating }.sum.to_f / self.reviews.count
    end.each_with_index.max[1]
    
    self.products[product_with_highest_rating]
  end

  def remove_reviews(product:)
    self.reviews.each do |review|
      review.destroy if review.product_id == product.id    
    end
  end
end

