class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :contractor_name,:address, presence: true, length: { maximum: 80 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :contracts
  has_many :claims
  has_many :posts
  has_many :contacts
  has_many :comments
  
  has_many :likes
  has_many :likeings, through: :likes, source: :post
  
  def like(other_post)
    self.likes.find_or_create_by(post_id: other_post.id)
  end
  
  def unlike(other_post)
   like = self.likes.find_by(post_id: other_post.id)
   like.destroy if like
  end
  
  def likeing?(other_post)
    self.likeings.include?(other_post)
  end
  
  
  
end
