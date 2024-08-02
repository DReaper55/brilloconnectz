import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
        width: size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Or',
                style: Styles.w500(
                  size: 16,
                  color: BrilloColors.black,
                ),
              ),
            ),
            buildDivider(),
          ],
        ),
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: BrilloColors.lightGrey,
        height: 1.5,
        thickness: 1.5,
      ),
    );
  }
}
