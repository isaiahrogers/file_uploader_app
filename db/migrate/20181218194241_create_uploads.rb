class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.string :name, null: false
      t.boolean :imported, default: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
