class ExchangesController < ApplicationController
  def index
  end

  def convert
    value = ExchangeService.new(params[:source_currency], params[:target_currency], params[:amount], crypto?).perform
    render json: {"value": value}
  end

  private

  def crypto?
    cryptos = ExchangesHelper.crypto_list
    cryptos.include?(params[:source_currency]) || cryptos.include?(params[:target_currency])
  end

end
