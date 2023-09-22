import 'dart:async' show Future;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rapexa_academy/structure/data/models/response/get_posts_rp.dart';
import 'package:rapexa_academy/structure/data/models/response/get_products_rp.dart';
import 'package:rapexa_academy/structure/data/models/response/logins_and_forgot_and_register_rp.dart';


const usernameKey = "username";
const passwordKey = "password";
const tokenKey = "tokenKey";
const appThemeKey = "appTheme";
const productsKey = "products";
const postsKey = "postsKey";
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

  static LoginRp? getUser() {
    try {
      return LoginRp.fromJson(
          jsonDecode(box.get(tokenKey, defaultValue: "")!));
    } on Exception catch (e) {
      e.printError();
      return null;
    }
  }

  static setUser(LoginRp value) async {
      return box.put(tokenKey, jsonEncode(value.toJson()));
  }

  static bool linkIsInitialized(String link) {
      return box.get(link) != null;
  }

  static addLinkIsInitialized(String link) {
    return box.put(link, "1");
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

  static GetProductsRp? getProducts() {
    try {
      return GetProductsRp.fromJson(
          jsonDecode(box.get(productsKey, defaultValue: "")!));
    } on Exception catch (e) {
      e.printError();
      return null;
    }
  }

  static setProducts(dynamic value) {
    try{
      box.put(productsKey, jsonEncode(value.toJson()));
    }catch(e){
      e.printError();
    }
  }

  static GetPostsRp? getPosts() {
    try {
      return GetPostsRp.fromJson(
          jsonDecode(box.get(postsKey, defaultValue: "")!));
    } on Exception catch (e) {
      e.printError();
      return null;
    }
  }

  static setPosts(dynamic value) {
    try{
      box.put(postsKey, jsonEncode(value.toJson()));
    }catch(e){
      e.printError();
    }
  }


}
