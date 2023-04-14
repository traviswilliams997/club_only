class User < ApplicationRecord
 # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :posts, foreign_key: :user_id,dependent: :destroy

 


    def with_post
      build_post if post.nil?
      self
      
    end
end
