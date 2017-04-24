class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new # guest user (not logged in)
     if user.admin?
     can :manage, :all
     else
     can :update, Meme do |meme|
     meme.user == user
     end
     can :destroy, Meme do |meme|
     meme.user == user
     end
     can :update, Comment do |comment|
     comment.user == user
     end
     can :destroy, Comment do |comment|
     comment.user == user
     end
     can :create, Meme
     can :create, Comment
     end
  end   
end
