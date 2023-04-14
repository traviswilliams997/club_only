class PostsController < ApplicationController
    before_action :set_post, only: [:show]

    before_action :authenticate_user! , except: [:index, :show]
def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
    @users = User.all
end

def show 
    @posts = Post.all.order("created_at DESC")
    @users = User.all
end
   def new 
    @post = current_user.posts.build
   end 
def edit 
    @posts =  Post.all.order("created_at DESC")
    @users = User.all

end 
    def create
        @post = current_user.posts.build(post_params)

        if @post.save!
            flash[:success] = "Content Successfully Created"

            redirect_to root_path
       else
        @posts =  Post.all

        flash[:alert] = @post.errors.count
        
          render :new,  alert: 'Post was not created.'
        end

    end
    
      private
      
  
      def set_post
        @post = Post.find(params[:id])
      end
  
        def post_params
          params.require(:post).permit(:title, :body, :user_id)
        end

      
        
end
