class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_many :memes
    
         
   has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, 
   default_url: "https://s3.amazonaws.com/roressentials/place.png"
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
