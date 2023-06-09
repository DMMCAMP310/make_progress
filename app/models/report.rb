class Report < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reviews
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  PER = 15
  
  scope :display_list, -> (category, page) { 
    if category != "none"
      where(category_id: category).page(page).per(PER)
    else
      page(page).per(PER)
    end
  }
  
  def reviews_new
    reviews.new
  end
end
