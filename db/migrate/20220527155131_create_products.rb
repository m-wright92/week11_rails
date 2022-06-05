# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :coo
      t.integer :cost

      t.timestamps
    end
  end
end
