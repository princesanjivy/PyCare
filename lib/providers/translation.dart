import 'package:flutter/material.dart';

class TranslationText with ChangeNotifier {
  String currentLanguage = "english";

  Map translation = {
    "pycare": ["பைக்கேர்", "पता"],
    "about us": ["எங்களை பற்றி", "हमारे बारे में"],
  };

  void setCurrentLanguage(String lang) {
    this.currentLanguage = lang;
    notifyListeners();
  }

  String getTranslatedText(String text) {
    if (currentLanguage == "english") {
      return text;
    } else {
      text = text.toLowerCase();

      if (currentLanguage == "tamil") {
        return translation[text][0];
      } else {
        return translation[text][1];
      }
    }
  }
}
