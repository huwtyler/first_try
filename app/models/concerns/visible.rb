module Visible
    extend ActiveSupport::Concern
  
    class_methods do
      def public_count
        all().count
      end

     
    end

  end
  