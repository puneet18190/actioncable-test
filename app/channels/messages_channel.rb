class MessagesChannel < ApplicationCable::Channel  
  # def subscribed
  #   stream_from 'messages'
  # end

  def follow(data)
    stop_all_streams
    stream_from "messages" #"messages:#{data['message_id'].to_i}:comments"
  end

  def unfollow
    stop_all_streams
  end
end  
