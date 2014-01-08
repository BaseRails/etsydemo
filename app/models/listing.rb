class Listing < ActiveRecord::Base
  if Rails.env.development?
    has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
  else
    has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ":style/:id_:filename"
  end

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates_attachment_presence :image

  belongs_to :user
  has_many :orders
end
