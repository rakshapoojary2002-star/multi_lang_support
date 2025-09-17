import 'package:flutter/material.dart';
import 'package:my_localization/src/language_selector.dart';

class LanguageSwitcherWrapper extends StatelessWidget {
  final Widget child;

  const LanguageSwitcherWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        const Positioned(
          top: 40,
          right: 0,
          child: LanguageSelector(),
        ),
      ],
    );
  }
}
