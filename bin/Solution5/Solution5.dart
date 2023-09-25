/*1- We applied principle Single responsiple Each method has only one action and eny class has only method his own
2- 2- We applied principle Open_Closed method has ploygramipsm
*/

abstract class Email {
  static bool ValidateEmail(String email) {
    return email.contains("@");
  }

  static bool SendEmail(String? message) {
    //_smtpClient.Send(message);
    return true;
  }
}

abstract class Password {
  static void hashPassword() {
    //hashing implementation
  }
  static void savePassword() {
    //save to the db
  }
}

class UserService {
  void Register(String email, String password) {
    if (!Email.ValidateEmail(email))
      throw new Exception("Email is not an email");
    //var user = new User(email, password);
    //SendEmail(new MailMessage("mysite@nowhere.com", email) { Subject="HEllo foo" });
  }
}

void main(List<String> args) {
  try {
    
    UserService u = UserService();
    u.Register("asddf", "dfsfg");
  } catch (e) {
    print(e);
  }
}
