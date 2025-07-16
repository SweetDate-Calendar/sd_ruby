# lib/sweet_date/tiers.rb
module SweetDate
  module Tiers
    extend ActiveSupport::Concern

    class_methods do
      def create_tier(from: :name, to: :tier_id)
        before_validation do
          next if self[to].present?

          result = SweetDate::Tier.create(self[from])

          if result["status"] == "ok"
            self[to] = result["id"] || result["message"]
          else
            cleaned = Array(result["message"]).map { |msg| msg.split("::", 2).last.strip }
            errors.add(:base, "Could not create tier in SweetDate: #{cleaned.join(', ')}")
          end
        end
      end
    end
  end
end