import 'package:flutter/material.dart';

import 'my_text.dart';

enum MenuOption { English, Tamil, Hindi }

class popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            child: InkWell(
              child: MyText(
                text: "English",
              ),
              onTap: () {},
            ),
            value: MenuOption.English,
          ),
          PopupMenuItem(
            child: InkWell(
              child: MyText(
                text: "Tamil",
              ),
              onTap: () {},
            ),
            value: MenuOption.Tamil,
          ),
          PopupMenuItem(
            child: InkWell(
              child: MyText(
                text: "Hindi",
              ),
              onTap: () {},
            ),
            value: MenuOption.Hindi,
          ),
        ];
      },
    );
  }
}
