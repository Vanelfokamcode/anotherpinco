class Product < ApplicationRecord
    
    has_many :order_items
    
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true 


    has_one_attached :image_1
    # for each we gonna have a file upload instead
    # of just a string
    # mount_uploader :image_1, ProductImageUploader
    # mount_uploader :image_2, ProductImageUploader
    # mount_uploader :image_3, ProductImageUploader
    # mount_uploader :image_4, ProductImageUploader
    # mount_uploader :image_5, ProductImageUploader




end
