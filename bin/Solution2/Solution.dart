/*1- We applied principle Single responsiple Each method has only one action 
2- We applied principle Open_Closed method has ploygramipsm
3- We applied principle Liskov substitution all Any Super class Message of method then used by Conncrete class Gmail,Yahoo,Hotmail*/
abstract class Message {
  void send();
}

class Gmail implements Message {
  @override
  void send() {
    print('This is a Gmail message');
  }

  // void send() {
  //   print('This is a Gmail message');
  // }
}

class Yahoo implements Message{
  @override
  void send() {
    print('This is a Yahoo message');
  }

  // void send() {
  //   print('This is a Yahoo message');
  // }
}

class Hotmail implements Message{
  @override
  void send() {
  print('This is a Hotmail message');  
  }

  // void send() {
  //   print('This is a Hotmail message');
  // }
}

class Notification {
  Gmail gmailService = Gmail();
  Yahoo yahooService = Yahoo();
  Hotmail hotmailService = Hotmail();

  void sendGmail() {
    gmailService.send();
  }

  void sendYahoo() {
    yahooService.send();
  }

  void sendHotmail() {
    hotmailService.send();
  }
}

void main() {
  Notification notification = Notification();
  notification.sendGmail();
  notification.sendYahoo();
  notification.sendHotmail();
}
