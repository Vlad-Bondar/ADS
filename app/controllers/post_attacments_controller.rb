class PostAttacmentsController < ApplicationController
    def new
        @post_attachment = PostAttachment.new(user_id :11)
    end

    def create
        @post_attachment = PostAttachment.new(attacment_params)
        byebug
        if @post_attachment.save
            redirect_to post_path
        else
            render new_post_attacment_path
        end
    end

    private
    def attacment_params
        params.permit(:attachment)
    end
end
