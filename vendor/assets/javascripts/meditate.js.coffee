jQuery ->
  $(".js_inline_validate .js_validate_me").on 'blur', ->
    field = this
    field_name = this.id
    field_value = $(field).val()
    url = $(field).closest('form').data('validateUrl') + '?' + field_name + '=' + field_value
    $.ajax url,
      type: 'POST'
      dataType: "json"
      success: (data, textStatus, jqXHR) ->
        if data['valid']
          $("." + 'js_' + data['object'] + '_' + data['field_name']).closest('.field').removeClass('field_with_errors')
        else
          $("." + 'js_' + data['object'] + '_' + data['field_name']).closest('.field').addClass('field_with_errors')