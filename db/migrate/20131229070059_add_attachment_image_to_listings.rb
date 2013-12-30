class AddAttachmentImageToListings < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :listings, :image
  end
end
