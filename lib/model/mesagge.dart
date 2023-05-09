
class Mesagge {
  final String message;
  final String senderUsername;
  final DateTime sentAt;

  Mesagge({
    required this.message,
    required this.senderUsername,
    required this.sentAt,
  });

  factory Mesagge.fromJson(Map<String, dynamic> message) {
    return Mesagge(
      message: message['message'],
      senderUsername: message['senderUsername'],
      sentAt: DateTime.fromMillisecondsSinceEpoch(message['sentAt']),
    );
  }
}