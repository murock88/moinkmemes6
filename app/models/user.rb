class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_many :memes, dependent: :destroy #will delete memes associated with memes
         
        
         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         
         has_many :following, through: :active_relationships, source: :followed
         has_many :followers, through: :passive_relationships, source: :follower
         
         
         def follow(other)  # follow another user
           active_relationships.create(followed_id: other.id)
         end
         
         # unfollow a user
         def unfollow(other)
           active_relationships.find_by(followed_id: other.id).destroy
         end
         
         # is following a user?
         def following?(other)
           following.include?(other)
         end
         
   has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, 
   default_url: "https://s3.amazonaws.com/roressentials/place.png"
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
