$(document).ready ->

  timer = undefined
  delay = 400 # 0.4 seconds delay after last input

  $source_currency = $("#source_currency")
  $target_currency = $("#target_currency")
  $result = $('#result')
  $amount = $('#amount')

  $btn_invert = $('#btn_invert')

  convert = ->
    window.clearTimeout timer

    timer = window.setTimeout((->
      amount = $amount.val()

      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $source_currency.val(),
                  target_currency: $target_currency.val(),
                  amount: amount
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $result.val(data.value)

      return false;
    ), delay)

  $amount.keyup -> convert()

  $btn_invert.click ->
    source = $source_currency.val()
    target = $target_currency.val()

    $source_currency.val(target)
    $target_currency.val(source)

    convert()
