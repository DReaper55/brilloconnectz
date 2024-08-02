import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DandCWidget extends StatelessWidget {
  final String first;
  final String last;
  final void Function()? onTap;
  const DandCWidget(
      {super.key,
      required this.first,
      required this.last,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: first,
      style: Styles.w500(
        size: 16,
        color: BrilloColors.grey,
      ),
      children: [
        TextSpan(
          text: last,
          style: Styles.w500(
            size: 16,
          ),
          recognizer: TapGestureRecognizer()..onTap = onTap,
        )
      ],
    ));
  }
}
