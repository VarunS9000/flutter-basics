class User{
  static late String name;
  static late String email;
  static late String password;

  static Future<bool> setAttributes(String userName, String userEmail, String userPassword) async{

    await Future.delayed(Duration(seconds: 3));

    name = userName;
    email = userEmail;
    password = userPassword;

    return true;
    

  }
}