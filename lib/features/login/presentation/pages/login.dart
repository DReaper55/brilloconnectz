import 'package:brilloconnectz/core/helpers/helpers_functions.dart';
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/dimensions.dart';
import 'package:brilloconnectz/core/utils/routes.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:brilloconnectz/core/utils/validations.dart';
import 'package:brilloconnectz/general_widgets/brillo_text_field.dart';
import 'package:brilloconnectz/general_widgets/shrink_button.dart';
import 'package:brilloconnectz/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifiers/login_notifier.dart';
import '../notifiers/visibility_state.dart';
import '../widgets/dandc.dart';
import '../widgets/or_divider.dart';
import '../widgets/toggle.dart';

class Login extends HookConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginNotifierProvider);

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
                child: Text('Welcome back!',
                    style: Styles.w600(size: 28),
                            ),
              )),
            const Spacing.smallHeight(),

            SizedBox(
              width: Helpers.width(context) * .8,
              child: Text('Please fill in your details to log into your account.',
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
                      loginNotifier.isEnabled.value = formKey.currentState!.validate();
                      loginNotifier.onChange();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //..............................
                        //  Email
                        //..............................
                        BrilloTextField(
                          label: "Email or Phone number",
                          controller: loginNotifier.emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          // validator: (value) => Validators.emailOrContact(loginNotifier.emailController.text),
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
                            controller: loginNotifier.passwordController,
                            suffixIcon: const EyeToggle(),
                            textInputAction: TextInputAction.send,
                            keyboardType: TextInputType.visiblePassword,
                            validator: Validators.notEmpty(),
                          );
                        }),
                        const Spacing.bigHeight(),
                        //..............................
                        //  Forgot password
                        //..............................
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, Routes.forgot),
                            child: Text(
                              'Forgot password?',
                              style: Styles.w400(
                                size: 16,
                                textDecoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        const Spacing.bigHeight(),
                        //..............................
                        //  Sign in button
                        //..............................
                        ShrinkButton(
                          text: "Sign in",
                          isExpanded: true,
                          isLoading: loginNotifier.isLoading.value,
                          isEnabled: loginNotifier.isEnabled.value,
                          onTap: loginNotifier.login,
                        ),
                        const Spacing.mediumHeight(),
                        const OrDivider(),
                        //..............................
                        //  Google sign in button
                        //..............................
                        ShrinkButton(
                          color: BrilloColors.white,
                          textColor: BrilloColors.primary,
                          hasBorder: false,
                          hasIcon: true,
                          isExpanded: true,
                          isLoading: loginNotifier.isLoading.value,
                          text: 'Log In with Google',
                          onTap: loginNotifier.signInWithGoogle,
                        ),
                      ],
                    ),
                  ),
                  const Spacing.largeHeight(),
                  //..............................
                  //  Register new account button
                  //..............................
                  DandCWidget(
                      first: 'Don\'t have an account? ',
                      last: 'Sign up!',
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
