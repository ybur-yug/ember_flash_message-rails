App.FlashView = Ember.View.extend

  templateName : 'flash'

  classNames : ['alert-box']

  classNameBindings : ['success', 'alert'],

  messageBinding : 'model.message',

  alertBinding : 'model.isAlert',

  successBinding : 'model.isSuccess',

  isEmpty : Ember.computed.empty 'message',

  didInsertElement : ->
    if @get('isEmpty')
      @hide()

  onMessageChange : (->
    @get('isEmpty') ? @hide() : @show()
  ).observes 'message',

  hide : ->
    this.$().hide()

  show : ->
    @.$().show()

  click : ->(e)
    e.preventDefault()
    @get'model'.clear()

