class AccountsController < ApplicationController
  def index
    @accounts = Account.all

    render json: @accounts
  end

  def show
    render json: @account
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :email, :password_digest, :tel, :role)
    end
end
