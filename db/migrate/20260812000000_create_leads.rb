# frozen_string_literal: true

class CreateLeads < ActiveRecord::Migration[8.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email, null: false
      t.string :source
      t.timestamps
    end

    add_index :leads, :email, unique: true
    add_index :leads, :created_at
  end
end
