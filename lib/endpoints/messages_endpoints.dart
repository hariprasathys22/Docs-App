class MessagesEndpoints {
  static const String baseUrl =
      'https://api.yourapp.com'; // Replace with your actual API base URL

  // Messages endpoints
  static const String getMessages = '$baseUrl/messages';
  static const String sendMessage = '$baseUrl/messages/send';
  static const String getConversations = '$baseUrl/conversations';
  static const String createConversation = '$baseUrl/conversations/create';
  static const String deleteMessage = '$baseUrl/messages/delete';
  static const String markAsRead = '$baseUrl/messages/read';

  // Real-time messaging endpoints
  static const String websocketUrl = 'wss://api.yourapp.com/ws/messages';
}
