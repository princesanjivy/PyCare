import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/providers/translation.dart';
import 'package:url_launcher/url_launcher.dart';

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
              child: ListTile(
                title: MyText(
                  text: "English",
                ),
                onTap: () {
                  translation.setCurrentLanguage("english");
                  Navigator.pop(context);
                },
                trailing: translation.currentLanguage == "english"
                    ? Icon(
                        Icons.check,
                        color: green,
                      )
                    : Opacity(
                        opacity: 0,
                        child: Icon(
                          Icons.check,
                          color: green,
                        ),
                      ),
              ),
              value: MenuOption.English,
            ),
            PopupMenuItem(
              child: ListTile(
                title: MyText(
                  text: "தமிழ்",
                ),
                onTap: () {
                  translation.setCurrentLanguage("tamil");
                  Navigator.pop(context);
                },
                trailing: translation.currentLanguage == "tamil"
                    ? Icon(
                        Icons.check,
                        color: green,
                      )
                    : Opacity(
                        opacity: 0,
                        child: Icon(
                          Icons.check,
                          color: green,
                        ),
                      ),
              ),
              value: MenuOption.Tamil,
            ),
            PopupMenuItem(
              child: ListTile(
                title: MyText(
                  text: "हिंदी",
                ),
                onTap: () {
                  translation.setCurrentLanguage("hindi");
                  Navigator.pop(context);
                },
                trailing: translation.currentLanguage == "hindi"
                    ? Icon(
                        Icons.check,
                        color: green,
                      )
                    : Opacity(
                        opacity: 0,
                        child: Icon(
                          Icons.check,
                          color: green,
                        ),
                      ),
              ),
              value: MenuOption.Hindi,
            ),
            PopupMenuItem(
              child: ListTile(
                title: MyText(
                  text: "Chat with Chitti",
                ),
                onTap: () {
                  launch(
                      'https://api.whatsapp.com/send/?phone=917598844833&text=Hi');
                  Navigator.pop(context);
                },
              ),
            ),
          ];
        },
      );
    });
  }
}
