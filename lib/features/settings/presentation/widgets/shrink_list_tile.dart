import 'package:flutter/material.dart';

class ShrinkListTile extends StatefulWidget {
  final Widget? subtitle;
  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? textColor;
  final Color? iconColor;
  final bool enabled;
  final ShapeBorder? shape;
  final double? minLeadingWidth;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;

  const ShrinkListTile({
    super.key,
    this.textColor,
    required this.title,
    this.enabled = true,
    this.onTap,
    this.leading,
    this.horizontalTitleGap,
    this.iconColor,
    this.minLeadingWidth,
    this.minVerticalPadding,
    this.onLongPress,
    this.shape,
    this.subtitle,
    this.trailing
  });

  @override
  State<ShrinkListTile> createState() => _ShrinkListTileState();
}

class _ShrinkListTileState extends State<ShrinkListTile>
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
        onTap: widget.onTap,
        child: ListTile(
          subtitle: widget.subtitle,
          title: widget.title,
          leading: widget.leading,
          trailing: widget.trailing,
          textColor: widget.textColor,
          iconColor: widget.iconColor,
          enabled: widget.enabled,
          shape: widget.shape,
          minLeadingWidth: widget.minLeadingWidth,
          horizontalTitleGap: widget.horizontalTitleGap,
          minVerticalPadding: widget.minVerticalPadding,
          onLongPress: widget.onLongPress,
        ),
      ),
    );
  }
}
