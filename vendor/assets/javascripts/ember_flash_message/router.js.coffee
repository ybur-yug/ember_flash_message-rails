Ember.Route.reopen Ember.FlashMessageRouteMixin,
  activate: ->
    @_super(arguments)
    controller = @controllerFor("flashMessage")
    routeName = @get("routeName")
    
    # do not display message in loading route, wait until
    # any loading is done.
    controller.now() if routeName isnt "loading"
