import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/services/navigation_services.dart';
import 'core/utils/routes.dart';
import 'core/utils/strings.dart';

final container = ProviderContainer();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Perform the token check before running the app
  final String initialRoute = await getInitialRoute();

  runApp(ProviderScope(child: BrilloConnectz(initialRoute: initialRoute,)));
}

Future<String> getInitialRoute() async {
  // Set to empty to route to login
  const token = 'Token';
  return token.isNotEmpty ? Routes.bottomNav : Routes.login;
}

class BrilloConnectz extends HookConsumerWidget {
  final String initialRoute;
  const BrilloConnectz({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: BrilloColors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        primarySwatch: BrilloColors.primarysWatch,
        primaryColor: BrilloColors.primary,
        scaffoldBackgroundColor: BrilloColors.white,
        splashColor: BrilloColors.lightGrey,
      ),
      initialRoute: initialRoute,
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: ref.read(navigationService).navigatorKey,
    );
  }
}
