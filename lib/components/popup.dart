import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pycare/providers/translation.dart';

import 'my_text.dart';

enum MenuOption { English, Tamil, Hindi }

class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationText>(builder: (context, translation, child) {
      return PopupMenuButton<MenuOption>(
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<MenuOption>>[
            PopupMenuItem(
              child: InkWell(
                child: MyText(
                  text: "English",
                ),
                onTap: () {
                  translation.setCurrentLanguage("english");
                  Navigator.pop(context);
                },
              ),
              value: MenuOption.English,
            ),
            PopupMenuItem(
              child: InkWell(
                child: MyText(
                  text: "தமிழ்",
                ),
                onTap: () {
                  translation.setCurrentLanguage("tamil");
                  Navigator.pop(context);
                },
              ),
              value: MenuOption.Tamil,
            ),
            PopupMenuItem(
              child: InkWell(
                child: MyText(
                  text: "हिंदी",
                ),
                onTap: () {
                  translation.setCurrentLanguage("hindi");
                  Navigator.pop(context);
                },
              ),
              value: MenuOption.Hindi,
            ),
          ];
        },
      );
    });
  }
}
