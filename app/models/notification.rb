class Notification < ApplicationRecord
  validates :ip, :count, presence: true
  scope :last_updated, -> { order(updated_at: :desc).last }

  after_save :send_notification

  def self.total
    # connection.execute('SELECT SUM (count) AS total FROM notifications').try(:[], 0).try(:[], "total")
    # http://api.rubyonrails.org/classes/ActiveRecord/Calculations.html
    sum(:count)
  end

  def self.ip
    last_updated.try(:ip)
  end

  def self.time
    last_updated.try(:updated_at).try(:strftime, "%Y-%m-%d %H:%M:%S")
  end

  def send_notification
    ActionCable.server.broadcast "notifications", notification: { total: self.class.total, ip: self.class.ip, time: self.class.time }.to_json
  end
end
