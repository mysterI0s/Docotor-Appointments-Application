import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBarItem bottomNavBarItem({
  required String title,
  String? icon,
}) {
  return BottomNavigationBarItem(
    tooltip: title,
    label: title,
    icon: (icon?.isNotEmpty ?? false)
        ? Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SvgPicture.asset(
              icon!,
              width: 24,
              height: 24,
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            width: 24,
            height: 24,
          ),
  );
}
