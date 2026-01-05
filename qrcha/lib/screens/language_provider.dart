import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  // Supported languages
  final Map<String, Map<String, String>> _languages = {
    'en': {
      'profile': 'Profile',
      'history': 'History',
      'account': 'Account',
      'logout': 'Logout',
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'phone': 'Phone Number',
      'location': 'Location',
      'save_profile': 'Save Profile',
      'change_language': 'Change Language',
    },
    'am': {
      'profile': 'መገለጫ',
      'history': 'ታሪክ',
      'account': 'መለያ',
      'logout': 'ውጣ',
      'first_name': 'ስም',
      'last_name': 'የአባት ስም',
      'phone': 'ስልክ',
      'location': 'ቦታ',
      'save_profile': 'መገለጫን ያስቀምጡ',
      'change_language': 'ቋንቋ ቀይር',
    },
  };

  String _currentLang = 'en';

  String get currentLang => _currentLang;

  void changeLanguage(String langCode) {
    if (_languages.containsKey(langCode)) {
      _currentLang = langCode;
      notifyListeners();
    }
  }

  String getText(String key) {
    return _languages[_currentLang]?[key] ?? key;
  }
}
