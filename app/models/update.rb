class Update < ApplicationRecord
    validates_presence_of :title

    def datetime_created
        datetime = created_at.in_time_zone("Eastern Time (US & Canada)")
        datetime.strftime("%B %d, %Y")
    end

    def datetime_modified
        datetime = updated_at.in_time_zone("Eastern Time (US & Canada)")
        datetime.strftime("%B %d, %Y at %I:%M %p ET")
    end
end