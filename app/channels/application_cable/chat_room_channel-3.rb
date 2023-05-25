class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_channel-3"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast "chat_room_channel-3", message: data["message"], sent_by: data["name"]
  end

  def announce(data)
    ActionCable.server.broadcast "chat_room_channel-3", chat_room_name: data["name"], type: data["type"]
  end
end