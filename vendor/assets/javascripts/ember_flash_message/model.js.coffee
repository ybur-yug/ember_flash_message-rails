App.FlashModel = Ember.Object.extend
 
  type : null,
 
  message : null,
 
  isAlert : Ember.computed.equal('type', 'alert'),
 
  isSuccess : Ember.computed.equal('type', 'success'),
 
  clear : function(){
    @update(null, null)
 
  update : function type, message
    @set 'type', type
    @set 'message', message

  success : function message
    @update 'success', message 

  alert : function message
    @update 'alert', message

# App.IndexRoute = Ember.Route.extend({
#  
#   actions : {
#  
#     setSuccess : function(){
#       App.get('flash').success('This is a success message.');
#     },
#  
#     setAlert : function(){
#       App.get('flash').alert('This is an alert message!');
#     },
#  
#     setCleared : function(){
#       App.get('flash').clear();
#     }
#  
#   }
#  
# });
