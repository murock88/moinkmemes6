class NewsfeedController < ApplicationController
    
  def home
    following = Array.new
        for @f in current_user.following do
         following.push(@f.id)
        end

    @memes = Meme.where("user_id IN (?)", following)
    @newMeme = Meme.new
  end
    
end