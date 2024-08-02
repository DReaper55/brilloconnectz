import 'package:brilloconnectz/core/services/navigation_services.dart';
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/routes.dart';
import 'package:brilloconnectz/core/utils/text_styles.dart';
import 'package:brilloconnectz/general_widgets/custom_scaffold.dart';
import 'package:brilloconnectz/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/shrink_list_tile.dart';

class Settings extends HookConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BrilloScaffold(
        title: 'Settings & Privacy',
        showLeadingBtn: false,
        showAccountButton: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Spacing.xxLargeHeight(),

              // ..........................
              // Change password
              // ..........................
              const _RouteRow(
                text: 'Change password',
                route: Routes.changePassword,
                iconData: Icons.remove_red_eye_outlined,
                color: Color(0x23007294),
                iconColor: Colors.blueGrey,
              ),
              const Spacing.mediumHeight(),

              // ..........................
              // Update Email
              // ..........................
              const _RouteRow(
                text: 'Update Email',
                route: Routes.updateEmail,
                iconData: Icons.mail_outline,
                color: Color(0x23007294),
                iconColor: Colors.blueGrey,
              ),
              const Spacing.mediumHeight(),

              // ..........................
              // Update Username
              // ..........................
              const _RouteRow(
                text: 'Update Username',
                route: Routes.updateUsername,
                iconData: Icons.person,
                color: Color(0x23007294),
                iconColor: Colors.blueGrey,
              ),
              const Spacing.mediumHeight(),

              // ..........................
              // Logout
              // ..........................
              _RouteRow(
                text: 'Logout',
                onTap: () {
                  ref.read(navigationService).navigateOffNamed(Routes.login);
                },
                iconData: Icons.close,
                color: const Color(0x23007294),
                iconColor: Colors.blueGrey,
              ),
              const Spacing.mediumHeight(),
            ],
          ),
        ));
  }
}

class _RouteRow extends StatelessWidget {
  final Color? iconColor;
  final Color? color;
  final IconData? iconData;
  final String text;
  final String? route;
  final void Function()? onTap;

  const _RouteRow(
      {
        this.iconData,
        required this.text,
        this.route,
        this.iconColor,
        this.onTap,
        this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ShrinkListTile(
          onTap: onTap ??
                  () {
                if (route == null) return;

                Navigator.of(context).pushNamed(route!);
              },
          leading: iconData != null ? Icon(iconData) : null,
          title: Text(text,
              style: Styles.w400(size: 14, color: BrilloColors.black))),
    );
  }
}
