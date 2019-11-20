class Transaction < ActiveRecord::Base
    attr_reader :banquet_name, :customer_email, :recipient_email
    attr_writer :banquet_name, :customer_email, :recipient_email
end
