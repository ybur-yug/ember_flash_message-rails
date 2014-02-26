Ember.FlashMessageController = Ember.Controller.extend
  queuedMessage: null
  currentMessage: null
  message: Ember.computed.alias "currentMessage"
  now: ->
    @setProperties
      queuedMessage: null
      currentMessage: @get "queuedMessage"
