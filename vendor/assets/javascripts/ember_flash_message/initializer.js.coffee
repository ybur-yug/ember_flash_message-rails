Ember.Application.initializer
  name: "flashMessage"
  initialize: (container, application) ->
    container.register "controller:flashMessage", Ember.FlashMessageController
