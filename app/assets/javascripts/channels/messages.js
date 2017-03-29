App.messages = App.cable.subscriptions.create('MessagesChannel', {

  connected: function(){
  	
  	setTimeout(function(){ 
  		if($("#messages").data("room-id") != undefined){
	  		App.messages.perform("follow")
	  	}else{
	  		App.messages.perform("unfollow")
	  	}
  	 }, 1000);
  },

  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  },

});