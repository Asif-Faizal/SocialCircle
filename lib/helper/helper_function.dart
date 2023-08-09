import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedinKey = "LOGGEDINKEY";
  static String usernameKey = "NAMEKEY";
  static String userEmailinKey = "EMAILKEY";
  //saving data
  //getting data
  static Future<bool?> getUserLoggedinStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedinKey);
  }
}
