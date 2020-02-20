class Album < ApplicationRecord
    mount_uploaders :images, ImageUploader
end
