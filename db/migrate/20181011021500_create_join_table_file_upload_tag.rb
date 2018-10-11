class CreateJoinTableFileUploadTag < ActiveRecord::Migration[5.2]
  def change
    create_join_table :file_uploads, :tags, id: :uuid do |t|
      t.uuid "file_upload_id", null: false
      t.bigint "tag_id", null: false
      t.index [:file_upload_id, :tag_id]
    end
  end
end
