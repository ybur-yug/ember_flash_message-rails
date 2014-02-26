Ember.FlashMessageController = Ember.Controller.extend
  queuedMessage: null
  currentMessage: null
  message: Ember.computed.alias "currentMessage"
  now: ->
    @setProperties
      queuedMessage: null
      currentMessage: @get "queuedMessage"

Ember.Handlebars.registerHelper "flashMessage", (options) ->
  template = options.fn
  container = options.data.keywords.controller.container
  controller = container.lookup("controller:flashMessage")
  parent = Ember.ContainerView.extend(hideAndShowMessage: (->
    currentMessage = @get("controller.currentMessage")
    view = if currentMessage then Ember.View.create(template: template) else undefined
    @set "currentView", view
  ).observes("controller.currentMessage"))
  options.hash.controller = controller
  options.hashTypes ||= {}
  Ember.Handlebars.helpers.view.call this, parent, options

Ember.Application.initializer
  name: "flashMessage"
  initialize: (container, application) ->
    container.register "controller:flashMessage", Ember.FlashMessageController

Ember.FlashMessageRouteMixin = Ember.Mixin.create flashMessage: (message) ->
  controller = @controllerFor "flashMessage"
  controller.set "queuedMessage", message
  controller

Ember.Route.reopen Ember.FlashMessageRouteMixin,
  activate: ->
    @_super(arguments)
    controller = @controllerFor("flashMessage")
    routeName = @get("routeName")
    
    # do not display message in loading route, wait until
    # any loading is done.
    controller.now() if routeName isnt "loading"


