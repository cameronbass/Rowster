if(window.location.pathname == "/subscribers/visit") {
  var redirectTimeoutId = window.setTimeout(redirectToHomepage, 15000)

  function redirectToHomepage() {
    window.location.href = '/subscribers/search'; // or whatever your homepage would be
  }

  window.addEventListener('click keypress mousemove', function() {
    window.clearTimeout(redirectTimeoutId)
  }, true)
}
