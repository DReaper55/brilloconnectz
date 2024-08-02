import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/dimensions.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'spacing.dart';

class BrilloTextField extends StatefulWidget {
  const BrilloTextField({
    super.key,
    this.label,
    this.readOnly = false,
    this.onTap,
    this.labelSize,
    this.labelColor,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.scrollPhysics,
    this.textAlign,
    this.validator,
    this.controller,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.enabled,
    this.initialValue,
    this.obscureText = false,
    this.textCapitalization,
  });

  final String? label;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? enabled;
  final bool readOnly;
  final String? initialValue;
  final TextAlign? textAlign;
  final ScrollPhysics? scrollPhysics;
  final TextCapitalization? textCapitalization;
  final double? labelSize;
  final Color? labelColor;

  @override
  BrilloTextFieldState createState() => BrilloTextFieldState();
}

class BrilloTextFieldState extends State<BrilloTextField> {
  final focusNode = FocusNode();
  bool isFocusNode = false;
  bool isErrorNode = false;

  @override
  void initState() {
    focusNode.addListener(_focusNodeListener);
    super.initState();
  }


  @override
  void dispose() {
    focusNode.dispose();
    return super.dispose();
  }

  void _focusNodeListener() {
    if(!focusNode.hasFocus){
      isFocusNode = false;
      isErrorNode = false;
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: Styles.w400(
              size: widget.labelSize ?? 16,
              color: widget.labelColor ?? BrilloColors.black,
            ),
          ),
        if (widget.label != null) const Spacing.mediumHeight(),
        StatefulBuilder(
          builder: (ctx, setState) => Container(
            margin: const EdgeInsets.symmetric(horizontal: Dimensions.small),
            child: TextFormField(
              focusNode: focusNode,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              initialValue: widget.initialValue,
              maxLines: widget.maxLines ?? 1,
              validator: widget.validator,
              controller: widget.controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: widget.enabled,
              scrollPhysics: widget.scrollPhysics,
              textAlign: widget.textAlign ?? TextAlign.start,
              minLines: widget.minLines ?? 1,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                border: InputBorder.none,
                labelStyle: TextStyle(
                  color: focusNode.hasFocus ? BrilloColors.primary : null,
                ),
                hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                contentPadding: const EdgeInsets.all(Dimensions.medium),
                focusedBorder: (){
                  setState((){
                    isFocusNode = true;
                    isErrorNode = false;
                  });
                  return OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: BrilloColors.primary, width: 2.0),
                    borderRadius: BorderRadius.circular(Dimensions.small),
                  );
                }(),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: BrilloColors.primary, width: 2.0),
                  borderRadius: BorderRadius.circular(Dimensions.small),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black54),
                  borderRadius: BorderRadius.circular(Dimensions.small),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: BrilloColors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(Dimensions.small),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: BrilloColors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(Dimensions.small),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
