import 'package:flutter/cupertino.dart';

import '../core/utils/colors.dart';

class BrilloLoader extends StatelessWidget {
  const BrilloLoader({
    super.key,
    this.color,
    this.size = 35,
  });
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? BrilloColors.white,
        animating: true,
      ),
    );
  }
}
