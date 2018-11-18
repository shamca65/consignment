# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $("#customer_phone").jqxMaskedInput({ width: '200px', height: '25px', mask: '(###)###-####' })
    $("#customer_email").jqxMaskedInput({ width: '200px', height: '25px', mask: '[a-z][A-Z][0-9]@[a-z][A-Z][0-9].aaa' })