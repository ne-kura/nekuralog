class Article < ApplicationRecord
    has_rich_text :content
    mount_uploader :image, ImageUploader
    acts_as_taggable_on :skills
    
end

