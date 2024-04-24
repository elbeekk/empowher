import 'package:empowher/domain/models/class/user.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _pref;

  static void init() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  static void setMe(UserModel user) async {
    if (_pref != null) {
      await _pref?.setString('me', user.toRawJson());
    }
  }

  static void removeMe() async {
    if (_pref != null) {
      await _pref?.remove(
        'me',
      );
    }
  }

  static UserModel? getMe() {
    if (_pref != null) {
      final raw = _pref?.getString('me');
      if (raw != null) {
        return UserModel.fromRawJson(raw ?? "");
      }
      return null;
    }
    return null;
  }

  static void setDisability(bool value) async {
    if (_pref != null) {
      await _pref?.setBool('disable', value);
    }
  }

  static bool getDisability() {
    if (_pref != null) {
      final raw = _pref?.getBool('disable');
      return raw ?? true;
    }
    return true;
  }

  static void setNotifications(bool value) async {
    if (_pref != null) {
      await _pref?.setBool('notification', value);
    }
  }

  static bool getNotifications() {
    if (_pref != null) {
      final raw = _pref?.getBool('notification');
      return raw ?? true;
    }
    return true;
  }

  static void setSharing(bool value) async {
    if (_pref != null) {
      await _pref?.setBool('location', value);
    }
  }

  static bool getSharing() {
    if (_pref != null) {
      final raw = _pref?.getBool('location');
      return raw ?? false;
    }
    return false;
  }

  static void setContacts(List<String> contacts) async {
    if (_pref != null) {
      await _pref?.setStringList('contacts', contacts);
    }
  }

  static List<String> getContacts() {
    if (_pref != null) {
      final raw = _pref?.getStringList('contacts');
      return raw ?? [];
    }
    return [];
  }
}
