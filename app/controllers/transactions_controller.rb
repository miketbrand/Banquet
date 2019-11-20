class TransactionsController < ApplicationController

  def show
    if(session[:user_id])
      user_id = session[:user_id]
      
      @debits = Transaction.where(:fromID => user_id)
      @debits.each do |debit|
        debit.banquet_name = Banquet.find(debit.banquetID).banquet_name
        debit.customer_email = User.find(user_id).email
        debit.recipient_email = User.find(debit.toID).email
      end
      
      @credits = Transaction.where(:toID => user_id)
      @credits.each do |credit|
        credit.banquet_name = Banquet.find(credit.banquetID).banquet_name
        credit.customer_email = User.find(credit.toID).email
        credit.recipient_email = User.find(user_id).email
      end
    else
      redirect_to login_path
    end
  end

  def create
    if(session[:user_id])
      banquet = Banquet.find(params[:id])
      Transaction.create!(:fromID => session[:user_id], :toID => banquet[:hostID], :banquetID => banquet[:id], :amount => banquet[:entryPrice])
      redirect_to transactions_path
    else
      redirect_to login_path
    end
  end
end
