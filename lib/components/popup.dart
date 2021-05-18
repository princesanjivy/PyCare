import 'package:flutter/material.dart';

import 'my_text.dart';

enum MenuOption { English, Tamil, Hindi }

class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            child: ListTile(
              title: MyText(
                text: "English",
              ),
              onTap: () {
                print('English');
              },
            ),
            value: MenuOption.English,
          ),
          PopupMenuItem(
            child: ListTile(
              title: MyText(
                text: "Tamil",
              ),
              onTap: () {
                print('tamil');
              },
            ),
            value: MenuOption.Tamil,
          ),
          PopupMenuItem(
            child: ListTile(
              title: MyText(
                text: "Hindi",
              ),
              onTap: () {
                print('Hindi');
              },
            ),
            value: MenuOption.Hindi,
          ),
        ];
      },
    );
  }
}
