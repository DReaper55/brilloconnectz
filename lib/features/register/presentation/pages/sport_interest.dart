import 'package:brilloconnectz/core/helpers/helpers_functions.dart';
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/strings.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:brilloconnectz/features/register/domain/entities/interest.dart';
import 'package:brilloconnectz/general_widgets/shrink_button.dart';
import 'package:brilloconnectz/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifiers/interest_notifier.dart';
import '../widgets/click_text_in_middle.dart';
import '../widgets/custom_checkbox.dart';


class SportInterest extends HookConsumerWidget {
  const SportInterest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interestNotifier = ref.watch(interestNotifierProvider);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        interestNotifier.setData();
      });

      return () {
      };
    }, []);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),

            const Spacing.height(56),

            //..............................
            //  Welcome message
            //..............................
            SizedBox(
                width: Helpers.width(context),
                child: Center(
                  child: Text('Almost There!',
                    style: Styles.w600(size: 28),
                  ),
                )),
            const Spacing.smallHeight(),

            Center(
              child: SizedBox(
                width: Helpers.width(context) * .8,
                child: Text('Please choose your sport interests',
                  textAlign: TextAlign.center,
                  style: Styles.w500(size: 14, color: BrilloColors.black),),
              ),
            ),
            const Spacing.height(64),

            SizedBox(
              height: (interestNotifier.interestInfoList.value.length) * 80.0,
              child: ListView.separated(
                separatorBuilder: (ctx, i) => const Spacing.mediumHeight(),
                itemCount: interestNotifier.interestInfoList.value.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final interestInfo = interestNotifier.interestInfoList.value[index];
                  final foundInterest = interestNotifier.selectedInterestInfo.value.firstWhere((element) => element.id == interestInfo.id, orElse: () => const InterestEntity());

                  bool isSelected = foundInterest.id != null;

                  return CustomCheckbox(
                    onTap: () => interestNotifier.toggleSelection(interestInfo),
                    value: interestInfo,
                    isSelected: isSelected,
                  );
                },
              ),
            ),

            const Spacing.xLargeHeight(),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 0.0),
              leading: Checkbox(
                value: interestNotifier.tAndCCheckBox.value,
                activeColor: BrilloColors.primary,
                onChanged: (value) => interestNotifier.toggleTAndCCheckBox(),
              ),
              title: ClickTextInMiddle(
                first: AppStrings.tAndCFirst,
                second: AppStrings.tAndCSecond,
                last: AppStrings.tAndCLast,
                onTap: interestNotifier.displayTAndC,
              ),
            ),
            const Spacing.xxLargeHeight(),
            ShrinkButton(
              text: "Register",
              isExpanded: true,
              isLoading: interestNotifier.isLoading.value,
              isEnabled: interestNotifier.isEnabled.value,
              onTap: interestNotifier.register,
            ),

            const Spacing.xxLargeHeight(),
          ],
        ),
      ),
    );
  }
}
