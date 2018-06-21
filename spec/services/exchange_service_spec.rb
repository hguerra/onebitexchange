require 'spec_helper'
require 'json'
require './app/services/exchange_service'

describe 'Currency' do
  it 'exchange common' do
    amount = rand(0..9999)
    res = ExchangeService.new("USD", "BRL", amount).perform

    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end

  it 'exchange crypto' do
    amount = rand(0..9999)
    res = ExchangeService.new("BTO", "BRL", amount, true).perform

    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end
end
