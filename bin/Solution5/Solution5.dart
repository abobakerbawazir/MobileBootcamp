/*1- We applied principle Single responsiple Each method has only one action and eny class has only method his own
2- 2- We applied principle Open_Closed method has ploygramipsm
*/

class Email {
  static bool ValidateEmail(String email) {
    return email.contains("@");
  }

  bool SendEmail(String? message) {
    //_smtpClient.Send(message);
    return true;
  }
}

class Password {
  void hashPassword() {
    //hashing implementation
  }
  void savePassword() {
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
    Email e = Email();
    Password p = Password();
    UserService u = UserService();
    u.Register("asddf", "dfsfg");
  } catch (e) {
    print(e);
  }
}