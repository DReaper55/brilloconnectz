
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/dimensions.dart';
import 'package:brilloconnectz/general_widgets/alert_bar.dart';
import 'package:flutter/material.dart';

class Helpers {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static InputDecoration inputdecor({
    String? hintText,
    TextStyle? hintStyle,
    EdgeInsetsGeometry? contentPadding,
  }) =>
      InputDecoration(
        contentPadding: contentPadding,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: BrilloColors.white,
        border: InputBorder.none,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.small),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: BrilloColors.black),
      );
  static InputDecoration dropDecor({
    String? hintText,
    EdgeInsetsGeometry? contentPadding,
  }) =>
      InputDecoration(
        contentPadding: contentPadding,
        filled: true,
        hintText: hintText,
        fillColor: BrilloColors.white,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: BrilloColors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      );
  static OutlineInputBorder replybod(double radius) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: BrilloColors.primary,
          width: 2.0,
        ),
      );
}

void showError({
  required String text,
  required BuildContext context,
  void Function()? onFinished,
}) {
  Alert.showNotification(
    message: text,
    context: context,
    notificationType: 1,
    onFinished: onFinished,
  );
}

void showSuccess({
  required String text,
  required BuildContext context,
  void Function()? onFinished,
}) {
  Alert.showNotification(
    message: text,
    context: context,
    notificationType: 0,
    onFinished: onFinished,
  );
}
