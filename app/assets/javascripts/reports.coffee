# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('.calc_button').click ->
        $parent = $(@).parent()
        $startTime = $parent.next().children()
        $endTime = $parent.next().next().children()

        if $startTime.val() isnt '' and $endTime.val() isnt ''
            return false

        nowTime = new Date()
        nowHour = toDoubleDigits(nowTime.getHours())
        nowMin = toDoubleDigits(nowTime.getMinutes())

        if $startTime.val() is ''
            $startTime.val(nowHour + ':' + nowMin)
        else
            $endTime.val(nowHour + ':' + nowMin)

    toDoubleDigits = (num) ->
        num += ''
        if num.length is 1
            num = '0' + num
        return num


link_to(link) ->
    location.href = link;
