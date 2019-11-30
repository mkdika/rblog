module ApplicationHelper
  class AuditTrail
    def self.to_model(versions)
      if versions.present?
        versions.map do |x|
          user = User.find_by_id x.whodunnit.to_i
          {
            "seq" => x.id,
            "event" => x.event,
            "desc" => x.object,
            "created_at" => x.created_at,
            "user" => user.present? ? user.show_display_name : "",
          }
        end
      end
    end
  end
end
