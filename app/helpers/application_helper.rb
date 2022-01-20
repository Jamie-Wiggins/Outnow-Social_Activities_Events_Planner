module ApplicationHelper
    
    def readable_time(time)
        time.strftime("%b %d, %I:%M%P")
    end

    def jamieTime(time)
        time = (time.to_time + 24.hours).to_datetime
    end

    def author_of(record)
        user_signed_in? && current_user.id == record.user_id
    end

    def events_ajax_previous_link
        ->(param, date_range) { link_to raw("&laquo;"), {param => date_range.first - 1.day}, remote: :true}
    end
          
    def events_ajax_next_link
        ->(param, date_range) { link_to raw("&raquo;"), {param => date_range.last + 1.day}, remote: :true}
    end
end
