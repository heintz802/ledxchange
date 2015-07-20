class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :manufacturer 

      t.string :image
      t.string :model
      t.integer :product_id
      t.text :description
      t.float :power
      t.integer :voltage_min
      t.integer :voltage_max
      t.integer :frequency_min
      t.integer :frequency_max
      t.integer :beam_angle
      t.integer :cct
      t.float :lumens
      t.integer :cbcp
      t.integer :efficacy
      t.integer :equivalent
      t.string :energy_star_status
      t.string :reference
      t.string :upc
      t.string :inner_carton_barcode
      t.string :outer_carton_barcode
      t.integer :cri
      t.float :light_emitting_area
      t.string :led_type
      t.integer :life_time
      t.integer :warranty
      t.float :diameter_width
      t.float :diameter_height
      t.float :lamp_weight
      t.integer :case_qty_inner
      t.integer :case_qty_outer
      t.float :inner_carton_diametter_width
      t.float :inner_carton_diametter_height
      t.float :inner_carton_diametter_weight
      t.float :outer_carton_diametter_width
      t.float :outer_carton_diametter_height
      t.float :outer_carton_diametter_weight
      t.integer :pallet_qty
      t.string :product_data_sheet
      t.string :dimming_campatibility
      # t.string :report_number
      # t.date :date
      # t.string :lab
      # t.float :current
      # t.float :pf
      # t.integer :r9
      # t.float :duv
      # t.float :in_rush_current
      # t.float :thd
      # t.float :housing_temperature
      # t.string :test_condition
    end
  end
end
