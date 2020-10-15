class PostsController < ApplicationController
###########################################22222222222222222222222222########################################

    before_action :authenticate_user!, except: [:index , :show]
    
    def index
        @posts = Post.all
        
    end

    def show 
        @post = Post.find(params[:id])
        #byebug
    end

    def new
        @post = Post.new
    end

    def create

        @post = Post.new(post_params)
        @post.user_id = current_user.id

        if @post.save 
            redirect_to '/posts/' + @post.id.to_s
        else
            render '/posts/new'
        end
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to '/posts/' + @post.id.to_s
        end
    end

    def delete
    end

    private 

    def post_params
        params.require(:post).permit(:header,:body)
    end

end