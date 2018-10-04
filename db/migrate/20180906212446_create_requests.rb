class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :status, default: "pending"
      t.integer :answers_count, default: 0
      t.string :request_type

      t.timestamps 
    end
  end
end
