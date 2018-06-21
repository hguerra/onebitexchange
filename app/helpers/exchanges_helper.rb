module ExchangesHelper

  def self.common_list
    [
      'AUD', 'BGN', 'BRL', 'CAD', 'CHF', 'CNY', 'CZK', 'DKK', 'EUR', 'GBP',
      'HKD', 'HRK', 'HUF', 'IDR', 'ILS', 'INR', 'JPY', 'KRW', 'MXN',
      'MYR', 'NOK', 'NZD', 'PHP', 'PLN', 'RON', 'RUB', 'SEK', 'SGD',
      'THB', 'TRY', 'USD', 'ZAR'
    ]
  end

  def self.crypto_list
    [
      'BTC', 'ETH', 'XRP', 'LTC', 'BCH'
    ]
  end

  def currency_list
    ExchangesHelper.common_list.concat ExchangesHelper.crypto_list
  end
end
