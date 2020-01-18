module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_customer

    def connect
      self.current_customer = find_verified_customer
    end

    private

      def find_verified_customer
        verified_customer = env['warden'].user(:customer)
        return reject_unauthorized_connection unless verified_customer
        verified_customer
      end
  end
end
