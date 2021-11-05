import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  static SharedPreferences _preferences;

  static const _keyUserName = 'userName';
  static const _keyUserEmail = 'userEmail';
  static const _keyUserProfession = 'userProfession';
  static const _keyUserState = 'userState';
  static const _keyUserSchool = 'userSchool';
  static const _keyUserClassroom = 'userClassroom';
  static const _keyUserSubject = 'userSubject';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUserName(String userName) async => await _preferences.setString(_keyUserName, userName);
  static String getUserName() => _preferences.getString(_keyUserName);

  static Future setUserEmail(String userEmail) async => await _preferences.setString(_keyUserEmail, userEmail);
  static String getUserEmail() => _preferences.getString(_keyUserEmail);

  static Future setUserProfession(String userProfession) async => await _preferences.setString(_keyUserProfession, userProfession);
  static String getUserProfession() => _preferences.getString(_keyUserProfession);

  static Future setUserState(String userState) async => await _preferences.setString(_keyUserState, userState);
  static String getUserState() => _preferences.getString(_keyUserState);

  static Future setUserSchool(String userSchool) async => await _preferences.setString(_keyUserSchool, userSchool);
  static String getUserSchool() => _preferences.getString(_keyUserSchool);

  static Future setUserClassroom(String userClassroom) async => await _preferences.setString(_keyUserClassroom, userClassroom);
  static String getUserClassroom() => _preferences.getString(_keyUserClassroom);

  static Future setUserSubject(String userSubject) async => await _preferences.setString(_keyUserSubject, userSubject);
  static String getUserSubject() => _preferences.getString(_keyUserSubject);
}