# NOTE: This is no longer maintained and uses a deprecated version of Ember.js

# Ember Flash Message

A simple plugin that allows you to display a message on the next route
transition, similiar to Rails' ``flash[:notice]``. This is useful for
displaying one time notices on later pages.

## Usage
Include 

    gem 'ember_flash_message-rails'
        
in your gemfile, and then also include
    
    //= require_tree ./ember_flash_message
    
In your app/javascripts/app_name.js.coffee file. 
Proceed to run bundle and it is ready to go

### Template

Any template that you want to display the message should contain the
following. It makes the most sense to put this in your ``application``
template to have the message be available on all pages.

```handlebars
{{#flashMessage}}
  {{message}}
{{/flashMessage}}
```
### Route

Any route can call ``@flashMessage(message)`` to set the message.
The message will be displayed after the next transition. After the
router transitions for a second time the message will be destroyed.

```CoffeeScript
Ember.LoginRoute = Ember.Route.extend
  actions:
    login: -> 
      // login user ...
      @flashMessage 'Welcome back!'
      @transitionTo 'index'
```

#### Instant Message

There may be some instances where you want to display the message right
away and not wait for the route to transition. You can use the ``now()``
function to update the message.

```CoffeeScript
Ember.ProfileRoute = Ember.Route.extend
  actions:
    save: -> profile
      profile.save().then(->
        @flashMessage 'Your profile has been updated!'.now()
```
To make an instant message disappear, on a .then() catch after running it do as follows: 

    Ember.run.later(@, ->
      @flashMessage(message: ""
      , timeUntilItShouldDisappearInMilliseconds))

### Styling
Simply assign a class to wrap where it is being called and the message can easily be styled to display however you please. 

### Todos

- Implement a means to simply allow multiple classes for failure/success/whatever messages
- Implement a custom timer for the .now() functionality to allow it to disappear at varying times on instantiation rather than being hard-coded
