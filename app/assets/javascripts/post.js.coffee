# // $oElement = $('div.cut')
# // alert("derp" + $oElement)
# // Cutter.run($oElement, $oElement, 100)

$ ->
  $('div.short').each (index) ->
    #Auto-clamp based on a fixed element height
    # $clamp($(this), {clamp: '35px'})
    $clamp(this, {clamp: 1, useNativeClamp: false});
    # alert(index + ': ' + $(this).text())
    # Cutter.run(this, this, 100)

    # $(this).truncate({max_length: 200});