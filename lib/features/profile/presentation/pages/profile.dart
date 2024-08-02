import 'package:brilloconnectz/core/helpers/helpers_functions.dart';
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/dimensions.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:brilloconnectz/features/profile/presentation/notifiers/profile_notifier.dart';
import 'package:brilloconnectz/general_widgets/brillo_text_field.dart';
import 'package:brilloconnectz/general_widgets/custom_scaffold.dart';
import 'package:brilloconnectz/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/profile_image.dart';

class Profile extends HookConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BrilloScaffold(
        title: 'Profile',
        showLeadingBtn: false,
        showAppBarDivider: false,
        padding: EdgeInsets.zero,
        showAccountButton: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileImage(),

              // ...........................
              // Email
              // ...........................
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.medium),
                child: BrilloTextField(
                  label: 'Email',
                  readOnly: true,
                  initialValue: 'info@example.mail',
                ),
              ),
              Spacing.mediumHeight(),

              // ...........................
              // Phone number
              // ...........................
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.medium),
                child: BrilloTextField(
                  label: 'Phone number',
                  readOnly: true,
                  initialValue: '08012356789',
                ),
              ),
              Spacing.mediumHeight(),

              // ...........................
              // Interests
              // ...........................
              _InterestWidget(),
              Spacing.xxLargeHeight(),

            ],
          ),
        ));
  }
}

class _InterestWidget extends HookConsumerWidget {
  const _InterestWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interestNotifier = ref.watch(profileNotifierProvider);
    interestNotifier.setData();

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.medium),
            child: Text('Your interests', style: Styles.w400(color: BrilloColors.black, size: 16),),
          ),
          const Spacing.mediumHeight(),

          SizedBox(
            height: 60,
            width: Helpers.width(context),
            child: ListView.builder(
                itemCount: interestNotifier.interestInfoList.value.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  final interestInfo = interestNotifier.interestInfoList.value[i];
            
                  return Container(
                    height: 60,
                    width: Helpers.width(context) * .5,
                    margin: const EdgeInsets.symmetric(horizontal: Dimensions.small),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(Dimensions.small),
                    ),
                    child: ListTile(
                      selectedColor: Colors.white,
                      selectedTileColor: BrilloColors.primary,
                      textColor: Colors.white,
                      selected: true,
                      leading: (){
                        Color color =  Colors.white;

                        if(interestInfo.iconData != null){
                          return Icon(interestInfo.iconData, color: color,);
                        }

                        return null;
                      }(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimensions.small),
                          side: const BorderSide(color: BrilloColors.primary, width: 2.0)),
                      title: Text(interestInfo.displayTitle!),
                    ),
                  );
                },
            ),
          )
        ],
      ),
    );
  }
}
