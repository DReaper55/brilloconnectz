import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickTextInMiddle extends StatelessWidget {
  final String first;
  final String second;
  final String last;
  final TextStyle? style;
  final void Function()? onTap;
  const ClickTextInMiddle(
      {super.key,
      required this.first,
      required this.second,
      required this.last,
      this.style,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: first,
      style: style ??
          Styles.w500(
            size: 14,
            color: Colors.black87,
          ),
      children: [
        TextSpan(
          text: second,
          style: style ??
              Styles.w500(size: 14, color: BrilloColors.primaryFade),
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
        TextSpan(
            text: last,
            style: style ??
                Styles.w500(
                  size: 14,
                  color: Colors.black87,
                ))
      ],
    ));
  }
}
