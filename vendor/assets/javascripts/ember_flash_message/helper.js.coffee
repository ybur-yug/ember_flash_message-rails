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
