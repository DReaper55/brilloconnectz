import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/general_widgets/app_loader.dart';
import 'package:flutter/material.dart';

import '../../core/helpers/helpers_functions.dart';
import '../../core/utils/dimensions.dart';
import 'spacing.dart';

class ShrinkButton extends StatefulWidget {
  final VoidCallback? onTap;
  final VoidCallback? onRetry;
  final Color? color, textColor;
  final String? text, assetIcon;
  final Icon? icon;
  final double? width, height, textSize;
  final EdgeInsetsGeometry? padding, margin;
  final bool isLoading, isEnabled, isExpanded, hasError, hasBorder, hasIcon;
  final double radius;
  final TextStyle? textStyle;

  const ShrinkButton({
    super.key,
    this.color,
    this.textStyle,
    this.icon,
    this.textColor,
    this.width,
    this.text,
    this.assetIcon,
    this.onTap,
    this.padding,
    this.margin,
    this.height = 56,
    this.onRetry,
    this.isExpanded = false,
    this.isLoading = false,
    this.isEnabled = true,
    this.hasError = false,
    this.hasBorder = false,
    this.hasIcon = false,
    this.radius = 12,
    this.textSize,
  });

  @override
  State<ShrinkButton> createState() => _ShrinkButtonState();
}

class _ShrinkButtonState extends State<ShrinkButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    _animation = Tween<double>(begin: 1, end: 0.93).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasFocus = FocusScope.of(context).hasFocus;

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: InkResponse(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) => _controller.reverse(),
        onTapCancel: () => _controller.reverse(),
        radius: 0.0,
        onTap: widget.hasError
            ? widget.onRetry
            : widget.isLoading
                ? null
                : (!widget.isEnabled
                    ? null
                    : () {
                        if (hasFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        widget.onTap?.call();
                      }),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: widget.height,
          padding: widget.padding,
          margin: widget.margin ??
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            border: widget.hasBorder
                ? Border.all(width: 2.0, color: BrilloColors.primary)
                : null,
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.color ??
                (!widget.isEnabled
                    ? BrilloColors.primaryFade
                    : BrilloColors.primary),
          ),
          alignment: Alignment.center,
          width: () {
            if (widget.isExpanded && widget.width == null) {
              return Helpers.width(context);
            }

            if (!widget.isExpanded && widget.width == null) {
              if (widget.hasIcon) {
                return (widget.text!.length * Dimensions.mediumBig);
              }

              return (widget.text!.length * Dimensions.medium);
            }

            if (widget.width != null) {
              return widget.width;
            }
          }(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!widget.isLoading)
                widget.hasIcon
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.icon != null) widget.icon!,
                          if (widget.assetIcon != null)
                            Image.asset(
                              widget.assetIcon!,
                            ),
                          const Spacing.mediumWidth(),
                          Text(
                            widget.text ?? "Next",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: widget.textSize ?? 16,
                              color: widget.textColor ?? BrilloColors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Text(
                        widget.text ?? "Next",
                        style: widget.textStyle ??
                            TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: widget.textSize ?? 16,
                              color: widget.textColor ?? BrilloColors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
              if (widget.isLoading)
                BrilloLoader(
                  color: widget.textColor ?? BrilloColors.white,
                )
            ],
          ),
        ),
      ),
    );
  }
}
