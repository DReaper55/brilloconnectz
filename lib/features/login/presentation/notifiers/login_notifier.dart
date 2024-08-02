import 'package:brilloconnectz/core/helpers/extensions.dart';
import 'package:brilloconnectz/core/utils/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginNotifierProvider =
    ChangeNotifierProvider((ref) => LoginNotifier(ref));

class LoginNotifier extends ChangeNotifier {
  final Ref ref;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isEnabled = ValueNotifier(false);
  final isLoading = ValueNotifier(false);

  LoginNotifier(this.ref);

  void login() {
  }

  void signInWithGoogle() {
  }

  void onChange() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if(!email.contains(Validators.emailPattern) && !email.contains(Validators.contactPattern)){
      return;
    }

    if(password.isEmpty){
      return;
    }

    isEnabled.value = true;
    notifyListeners();
  }
}