require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  test'should not save empty conversation_id' do
    conversation=Conversation.new(:sender_id =>'',:recipient_id=>'')
    assert_not conversation.save
  end

end
