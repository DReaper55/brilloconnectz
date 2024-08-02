import 'package:brilloconnectz/core/helpers/helpers_functions.dart';
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/dimensions.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Helpers.width(context),
      height: Helpers.height(context) * .4,
      child: Stack(
        children: [
          // ...............................
          // Dim user image
          // ...............................
          Container(
            width: Helpers.width(context),
            height: Helpers.height(context) * .25,
            color: Colors.black.withOpacity(.45),
          ),

          // ...............................
          // Change user image button
          // ...............................
          Positioned(
            left: (Helpers.width(context) * .35),
            top: Helpers.width(context) * .15,
            child: OutlinedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(83))),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: BrilloColors.white)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: Dimensions.medium,
                            horizontal: Dimensions.smallMedium))),
                onPressed: () {},
                child: Text(
                  'Change photo',
                  style: Styles.w400(size: 16, color: BrilloColors.white),
                )),
          ),

          // ...............................
          // User logo
          // ...............................
          Positioned(
            left: 20.0,
            bottom: 50,
            child: Stack(children: [
              // ...............................
              // Logo image
              // ...............................
              const _CircleAvatar(),

              // ...............................
              // Image picker
              // ...............................
              Positioned(
                bottom: 0,
                right: 10,
                child: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: BrilloColors.primary,
                    radius: 18,
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}


class _CircleAvatar extends StatelessWidget {

  const _CircleAvatar();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: BrilloColors.lightGrey,
      radius: 70,
      child: CircleAvatar(
          backgroundColor: BrilloColors.white,
          radius: 68,
          child: Icon(Icons.person),
          ),
    );
  }
}
