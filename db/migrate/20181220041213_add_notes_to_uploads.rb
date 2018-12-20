class AddNotesToUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :uploads, :notes, :string
  end
end
