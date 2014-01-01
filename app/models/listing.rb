class Listing < ActiveRecord::Base
  paperclip_options = { :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg" }

  unless Rails.env.development?
    paperclip_options.merge!  :storage => :dropbox,
                              :path => ":style/:id_:filename",
                              :dropbox_credentials => {
                                app_key: "9s6t8tsrl0turoi",
                                app_secret: ENV["APP_SECRET"],
                                access_token: "189egb1nw6bjljr7",
                                access_token_secret: ENV["ACCESS_TOKEN_SECRET"],
                                user_id: "251697068",
                                access_type: "app_folder"
                              }
  end

  has_attached_file :image, paperclip_options

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates_attachment_presence :image

  belongs_to :user
end
