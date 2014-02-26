Ember.FlashMessageRouteMixin = Ember.Mixin.create flashMessage: (message) ->
  controller = @controllerFor "flashMessage"
  controller.set "queuedMessage", message
  controller
