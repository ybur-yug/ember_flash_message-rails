App = Ember.Application.create rootElement: "#qunit-fixture"
App.Router.map ->
  @route "page1"
  @route "page2"
  @route "promise"
  

App.PromiseRoute = Ember.Route.extend(model: ->
  new Ember.RSVP.Promise((resolve) ->
    Ember.run.later(->
      resolve()  
      , 100)
)
App.LoadingRoute = Ember.Route.extend()
Ember.TEMPLATES.application = Ember.Handlebars.compile("{{#flashMessage}}<span class=\"message\">{{message}}</span>{{/flashMessage}}")
findMessage = ->
  $ "#qunit-fixture .message"

messageExists = ->
  findMessage().length > 0

assertMessage = ->
  ok messageExists()

assertNoMessage = ->
  ok not messageExists()

router = ->
  App.__container__.lookup "route:application"

App.setupForTesting()
module "Integration App Test",
  setup: ->
    App.reset()
    App.injectTestHelpers()

test "should not see the flash if there is no message", ->
  visit "/"
  andThen assertNoMessage

test "should not see the flash message if there has not been a transition", ->
  visit "/"
  andThen ->
    router().flashMessage "hello world"

  andThen assertNoMessage

test "should see a flash message when I transition to the next route", ->
  expect 2
  visit "/"
  andThen ->
    router().flashMessage "hello world"

  visit "/page1"
  andThen assertMessage
  andThen ->
    equal findMessage().text().trim(), "hello world"

test "should not see a flash message once it has been displayed", ->
  visit "/"
  andThen ->
    router().flashMessage "test"

  visit "/page1"
  andThen assertMessage
  visit "/page2"
  andThen assertNoMessage

test "should not display or destroy the flash message when in the loading route", ->
  visit "/"
  andThen ->
    router().flashMessage "test"

  visit "/promise"
  andThen assertMessage

test "should display the flash message instantly", ->
  visit "/"
  andThen ->
    router().flashMessage("instant message").now()

  andThen assertMessage
