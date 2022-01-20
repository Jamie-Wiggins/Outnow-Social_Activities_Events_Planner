class Activity < ApplicationRecord
    has_one :chatroom, dependent: :destroy

    mount_uploader :image, ImageUploader

    def self.expired_activity(activity)
        if activity.finish_time.to_datetime.utc.to_i < DateTime.now.to_datetime.utc.to_i
            activity.update_column(:status, 0)
        end
    end

    validates :title, presence: true, length: { in: 3..30 }
    validates :description, presence: true, length: { in: 0..500 }
    validates :host, presence: true
    validates :host_rating, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :attendee_max, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 100}
    validates :start_time, presence: true
    validate :start_time_after_now
    validates :finish_time, presence: true
    validate :finish_after_start
    validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
    validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :icon, presence: true
    validates :tags, presence: true
    validates :color, presence: true, format: { with: /\A#([a-fA-F0-9]{6})\z/ }
    validates :status, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :cost, allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 0.3}

    def self.afterCreate(activity, person)
        (Chatroom.create(activity_id: activity.id, name: activity.title))
    end

    def self.afterCreate2(activity, person)
        (ChatroomUser.create(user_id: person, chatroom_id: activity.id, hidden_name: "host"))
    end

    private

    def start_time_after_now
        if start_time
            if start_time < (Time.now - 1.minutes)
                errors.add(:start_time, "start time can't be in the past")
                false
            end
        end
    end

    def finish_after_start
        if finish_time && start_time
            if finish_time < start_time
                errors.add(:finish_time, "finish cant be earlier than start time")
                false
            end
        end
    end

end
