import 'package:brilloconnectz/general_widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Buddies extends HookConsumerWidget {
  const Buddies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BrilloScaffold(
        title: 'Buddies',
        showLeadingBtn: false,
        showAccountButton: true,
        child: SizedBox());
  }
}