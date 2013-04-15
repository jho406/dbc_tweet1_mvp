class CreateBirds < ActiveRecord::Migration
  def change
    create_table :birds do |t|
      t.string :handle
    end
  end
end
