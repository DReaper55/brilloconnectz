import 'package:brilloconnectz/core/helpers/helpers_functions.dart';
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/dimensions.dart';
import 'package:brilloconnectz/core/utils/routes.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:brilloconnectz/core/utils/validations.dart';
import 'package:brilloconnectz/features/login/presentation/notifiers/visibility_state.dart';
import 'package:brilloconnectz/features/login/presentation/widgets/dandc.dart';
import 'package:brilloconnectz/features/login/presentation/widgets/toggle.dart';
import 'package:brilloconnectz/general_widgets/brillo_text_field.dart';
import 'package:brilloconnectz/general_widgets/shrink_button.dart';
import 'package:brilloconnectz/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifiers/register_notifier.dart';

class Register extends HookConsumerWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerNotifier = ref.watch(registerNotifierProvider);

    final formKey = useMemoized(() => GlobalKey<FormState>());

    useEffect(() {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
      ));
      return () {
        SystemChrome.restoreSystemUIOverlays();
      };
    }, []);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),

            const Spacing.height(56),

            //..............................
            //  Welcome message
            //..............................
            SizedBox(
              width: Helpers.width(context),
              child: Center(
                child: Text('BrilloConnectz',
                    style: Styles.w600(size: 28),
                            ),
              )),
            const Spacing.smallHeight(),

            SizedBox(
              width: Helpers.width(context) * .8,
              child: Text('Please fill in these details to create your account.',
                textAlign: TextAlign.center,
                style: Styles.w500(size: 14, color: BrilloColors.black),),
            ),

            const Spacing.height(64),
            //..............................
            //  Text fields and buttons
            //..............................
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.smallMedium),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    onChanged: () {
                      registerNotifier.isEnabled.value = formKey.currentState!.validate();
                      registerNotifier.onChange();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //..............................
                        //  Email
                        //..............................
                        BrilloTextField(
                          label: "Email",
                          controller: registerNotifier.emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.email(),
                        ),
                        const Spacing.bigHeight(),
                        //..............................
                        //  Email
                        //..............................
                        BrilloTextField(
                          label: "Phone number",
                          controller: registerNotifier.contactController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: Validators.contact(),
                        ),
                        const Spacing.bigHeight(),
                        //..............................
                        //  Password
                        //..............................
                        Consumer(builder: (context, ref, child) {
                          final state = ref.watch(visibilityProvider.state);
                          return BrilloTextField(
                            obscureText: !state.state,
                            label: "Password",
                            controller: registerNotifier.passwordController,
                            suffixIcon: const EyeToggle(),
                            textInputAction: TextInputAction.send,
                            keyboardType: TextInputType.visiblePassword,
                            validator: Validators.notEmpty(),
                          );
                        }),
                        const Spacing.bigHeight(),


                        //..............................
                        //  Sign in button
                        //..............................
                        ShrinkButton(
                          text: "Next",
                          isExpanded: true,
                          isLoading: registerNotifier.isLoading.value,
                          isEnabled: registerNotifier.isEnabled.value,
                          onTap: registerNotifier.navigateToNextPage,
                        ),
                      ],
                    ),
                  ),
                  const Spacing.largeHeight(),
                  //..............................
                  //  Register new account button
                  //..............................
                  DandCWidget(
                      first: 'Already a user? ',
                      last: 'Login',
                      onTap: () => Navigator.pushReplacementNamed(
                          context, Routes.register)),
                ],
              ),
            ),
            const Spacing.xxLargeHeight(),
          ],
        ),
      ),
    );
  }
}
