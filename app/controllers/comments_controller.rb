class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :my_sanitizer
  load_and_authorize_resource :through => :current_user    #These come from Cancancan
  
    def create
        @meme = Meme.find(params[:meme_id])   
        @comment = @meme.comments.create(params[:comment].permit(:body))
        @comment.user_id = current_user.id if current_user
    
        if @comment.save
            redirect_to meme_path(@meme), notice: "Your comment has been saved."
        else
             redirect_to 'new'
        end
    end
    
    
    
      def update
    @meme = Meme.find(params[:meme_id])
    @comment = @meme.comments.find(params[:id])
    
    if @comment.update(params[:comment].permit(:body))
      redirect_to meme_path(@meme), notice: "Your comment has been updated."
    else
      render 'edit'
    end
  end
    
    def edit
    @meme = Meme.find(params[:meme_id])
    @comment = @meme.comments.find(params[:id])
    end
    
    def destroy
    @meme = Meme.find(params[:meme_id])
    @comment = @meme.comments.find(params[:id])
    @comment.destroy
    redirect_to meme_path(@meme), notice: "Your comment has been deleted."
    end
    
    private
    
   def my_sanitizer
    params.require(:comment).permit(:body)
   end
  
    
end