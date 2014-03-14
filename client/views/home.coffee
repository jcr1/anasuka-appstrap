Template.home.events
  "click #login-button": (e, t) ->
    console.log 'click!'
    Router.go('/dashboard')
    $('body').removeClass('modal-open')
    $('.modal-backdrop').remove()