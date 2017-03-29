class LoansController < ApplicationController
  def new
    @loan = current_user.loans.build
  end

  def create
    @loan = current_user.loans.build(loan_params)
    if @loan.save
      flash[:success] = 'Loan successfully submitted!!'
      redirect_to current_user
    else
      flash[:danger] = 'Error'
      render 'new'
    end
  end
  private
  def loan_params
    params.require(:loan).permit(:fname, :lname, :mname, :id_no, :telephone, :gender, :work, :county, :school, :amount)
  end
end
