require 'test_helper'

class MessageTest < ActiveSupport::TestCase
    setup do
        @user1 = User.new(avatar: '', email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
        assert @user1.valid?
        assert @user1.save

        @user2 = User.new(avatar: '', email: 'jamie@gamil.com', username: 'wiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
        assert @user2.valid?
        assert @user2.save
    
        @activity = Activity.new(title: "Activity Title", description: "Activity Description", host: "host", attendee_max: 5, start_time: DateTime.now ,finish_time: (Time.now + 1.day),
        longitude: 45,latitude: 45,icon: "icon",tags: "tags",color: "#FFFFFF",status: 1,host_rating: 5,image: '')
        assert @activity.valid?
        assert @activity.save
    
        @chatroom = Chatroom.new(name: "Chatroom Name", activity: @activity)
        assert @chatroom.valid?
        assert @chatroom.save

        @chatroomuser1 = ChatroomUser.new(hidden_name: "host", user: @user1, chatroom: @chatroom)
        assert @chatroomuser1.valid?
        assert @chatroomuser1.save

        @chatroomuser2 = ChatroomUser.new(hidden_name: "snake", user: @user2, chatroom: @chatroom)
        assert @chatroomuser2.valid?
        assert @chatroomuser2.save
    end
    
    # failure case: should not save message with no values present
    test "should not save message with no values present" do
        message = Message.new
        refute message.valid?
        refute message.save
    end

    # success case: should save message with valid parameters user 1 sends to user 2
    test "should save valid message user 1 to user 2" do
        message = Message.new
        message.chatroom = @chatroom
        message.user = @user2
        message.hidden_name = "anonymous"
        message.sender = @user1.id
        message.body = "Hello"
        assert message.valid?
        assert message.save
   end

    # success case: should save message with valid parameters user 2 sends to user 1
    test "should save valid message user 2 to user 1" do
        message = Message.new
        message.chatroom = @chatroom
        message.user = @user1
        message.hidden_name = "anonymous"
        message.sender = @user2.id
        message.body = "Hello"
        assert message.valid?
        assert message.save
    end

    # success case: should not save message with null chatroom
    test "should not save message with null chatroom" do
        message = Message.new
        message.user = @user2
        message.hidden_name = "anonymous"
        message.sender = @user1.id
        message.body = "Hello"
        refute message.valid?
        refute message.save
    end

    # success case: should not save message with null user
    test "should save message with null user" do
        message = Message.new
        message.chatroom = @chatroom
        message.hidden_name = "anonymous"
        message.sender = @user1.id
        message.body = "Hello"
        refute message.valid?
        refute message.save
    end

    # success case: should not save message with null hidden name
    test "should not save message with null hidden name" do
        message = Message.new
        message.chatroom = @chatroom
        message.user = @user2
        message.sender = @user1.id
        message.body = "Hello"
        refute message.valid?
        refute message.save
    end

    # success case: should not save message with null sender
    test "should not save message with null sender" do
        message = Message.new
        message.chatroom = @chatroom
        message.user = @user2
        message.hidden_name = "anonymous"
        message.body = "Hello"
        refute message.valid?
        refute message.save
    end

    # success case: should not save message with invalid sender
    test "should not save message with sender id less than 0" do
        message = Message.new
        message.chatroom = @chatroom
        message.user = @user2
        message.hidden_name = "anonymous"
        message.sender = -1
        message.body = "Hello"
        refute message.valid?
        refute message.save
    end

    # success case: should not save message with null body
    test "should not save message with null body" do
        message = Message.new
        message.chatroom = @chatroom
        message.user = @user2
        message.hidden_name = "anonymous"
        message.sender = @user1.id
        refute message.valid?
        refute message.save
    end
end
