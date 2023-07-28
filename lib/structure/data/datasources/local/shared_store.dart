import 'dart:async' show Future;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


const usernameKey = "username";
const passwordKey = "password";
const tokenKey = "tokenKey";
const appThemeKey = "appTheme";
const batterOptimizeKey = "batterOptimizeKey";

class SharedStore {
  static late Box<String> box;

  static init({bool enableLogging = false}) async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    box = await Hive.openBox<String>("appConfig",
        encryptionCipher:
            HiveAesCipher("QePVSjsUBqpq4&lgEwPKKspPr@15Up==".codeUnits));
  }

  static void clearCache() async {
    clearUserIdentity();
    await box.flush();
    await box.compact();
  }

  static Future<void>? clearUserIdentity() async {
    await box.delete(usernameKey);
    await box.delete(passwordKey);
    await box.delete(tokenKey);
  }

  static String getUserName() {
    return box.get(usernameKey, defaultValue: "")!;
  }

  static setUserName(String username) async {
    await box.put(usernameKey, username);
  }

  static String getPassword() {
    return box.get(passwordKey, defaultValue: "")!;
  }

  static setPassword(String password) async {
    await box.put(passwordKey, password);
  }

  static String getToken() {
    return box.get(tokenKey, defaultValue: "")!;
  }

  static setToken(String value) {
    return box.put(tokenKey, value);
  }

  static bool getBatteryOptimizeDone() {
    return box.get(batterOptimizeKey, defaultValue: "0")! == "1";
  }

  static setBatteryOptimizeDone(bool value) {
    return box.put(batterOptimizeKey, value ? "1" : "0");
  }

  static String getTheme() {
    return (box.get(appThemeKey, defaultValue: "light")!);
  }

  static setTheme(String value) {
    return box.put(appThemeKey, value);
  }

}
