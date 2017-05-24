class AddAttachmentPhotoToFarmacia < ActiveRecord::Migration
  def self.up
    change_table :farmacia do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :farmacia, :photo
  end
end
