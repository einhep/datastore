class CreateUploadfies < ActiveRecord::Migration
  def change
    create_table :uploadfies do |t|

      t.timestamps null: false
    end
  end
end
