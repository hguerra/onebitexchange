require 'rest-client'
require 'json'

class ExchangeService

  def initialize(source_currency, target_currency, amount, is_crypto = false)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
    @is_crypto = is_crypto
  end

  def perform
    if @is_crypto
      value = perform_crypto_exchange
    else
      value = perform_common_exchange
    end

    @amount * value
  end

  private

  def perform_common_exchange
    begin
      exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:common_currency_api_url]
      exchange_api_key = Rails.application.credentials[Rails.env.to_sym][:common_currency_api_key]

      url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
      res = RestClient.get url

      JSON.parse(res.body)['currency'][0]['value'].to_f
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def perform_crypto_exchange
    begin
      exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:crypto_currency_api_url]

      url = "#{exchange_api_url}/price?fsym=#{@source_currency}&tsyms=#{@target_currency}"
      res = RestClient.get url

      JSON.parse(res)[@target_currency].to_f
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

end
