class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string :name
      t.string :description
      t.references :user ,index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :upload_files,[:user_id,:created_at]
  end
end
