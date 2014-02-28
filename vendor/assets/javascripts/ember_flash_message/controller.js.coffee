Ember.FlashMessageController = Ember.Controller.extend
  queuedMessage: null
  currentMessage: null
  message: Ember.computed.alias "currentMessage"
  messageType: Ember.computed.alias "messageType"
  now: ->
    @setProperties
      queuedMessage: null
      currentMessage: @get "queuedMessage"
      messageType: @get "messageType"
