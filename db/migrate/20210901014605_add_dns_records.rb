class AddDnsRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :dns_records do |t|
      t.string :ip
      t.datetime :created_at, null: false
      t.datetime :updated_at
    end
  end
end
