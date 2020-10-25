class PostAttachment < ApplicationRecord
    mount_uploader :attachemt, AttachmentUploader

    
end
