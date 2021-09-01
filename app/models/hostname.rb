class Hostname < ApplicationRecord

  scope :included, -> (hostname) { where(hostname: hostname) if hostname.present? }
  scope :excluded, -> (hostname) { where.not(hostname: hostname)  if hostname.present? }
end
