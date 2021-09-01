class AddHostnames < ActiveRecord::Migration[6.1]
  def change
    create_table :hostnames do |t|
      t.string :hostname, null: false

      t.references :dns_record, foreign_key: true, null: false
    end
  end
end
