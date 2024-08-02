import 'package:brilloconnectz/core/helpers/extensions.dart';
import 'package:brilloconnectz/core/services/navigation_services.dart';
import 'package:brilloconnectz/core/utils/routes.dart';
import 'package:brilloconnectz/core/utils/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerNotifierProvider =
    ChangeNotifierProvider((ref) => RegisterNotifier(ref));

class RegisterNotifier extends ChangeNotifier {
  final Ref ref;

  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final passwordController = TextEditingController();

  final isEnabled = ValueNotifier(false);
  final isLoading = ValueNotifier(false);

  RegisterNotifier(this.ref);

  void navigateToNextPage() {
    ref.read(navigationService).navigateToNamed(Routes.interests);
  }

  void onChange() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if(!email.contains(Validators.emailPattern)){
      return;
    }

    if(password.isEmpty){
      return;
    }

    isEnabled.value = true;
    notifyListeners();
  }
}