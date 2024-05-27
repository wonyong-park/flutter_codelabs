// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/supplemental/cut_corners_border.dart';

import 'home.dart';
import 'login.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => const HomePage(),
        // TODO: Make currentCategory field take _currentCategory (104)
        // TODO: Pass _currentCategory for frontLayer (104)
        // TODO: Change backLayer field value to CategoryMenuPage (104)
      },
      theme: _kShrineTheme,
    );
  }
}

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePink100,
    ),
    // TODO: Add the icon themes (103)
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kShrineBrown900,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: kShrinePink100,
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    // headline5
    headlineSmall: base.headlineSmall!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    // headline6
    titleLarge: base.titleLarge!.copyWith(
      fontSize: 18.0,
    ),
    // caption
    bodySmall: base.bodySmall!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    // bodyText1
    bodyLarge: base.bodyLarge!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}