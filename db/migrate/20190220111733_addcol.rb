class Addcol < ActiveRecord::Migration[5.2]
  def change
  	 change_table :users do |t|
   t.boolean :is_admin
end
  end
end
