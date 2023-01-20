module Visible
    extend ActiveSupport::Concern
  
    class_methods do
      def public_count
        all().count
      end

      def like_count
        where(interaction_type: 'like').count
      end
    end

  end
  