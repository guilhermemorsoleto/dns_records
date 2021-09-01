class DnsRecord < ApplicationRecord
  has_many :hostnames

  accepts_nested_attributes_for :hostnames
end
