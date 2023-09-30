import 'OBServerCoffeeDrinker.dart';

class Notification implements OBServerCoffeeDrinker {
  late DateTime timestamp;
  Notification(
      {required this.message, required this.timestamp, required this.name});
  void sendNotification({required String recipient}) {
    String formattedTimestamp = timestamp.toString();
    print("[$formattedTimestamp] Hey $recipient, $message");
  }

  @override
  String name;

  @override
  notify({required DateTime timestamp}) {
    Notification notification =
        Notification(message: message, timestamp: timestamp, name: name);
    notification.sendNotification(recipient: name);
  }

  @override
  String message;
}