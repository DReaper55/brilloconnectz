import 'package:brilloconnectz/general_widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Homepage extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BrilloScaffold(
        title: 'Homepage',
        showAccountButton: true,
        showLeadingBtn: false,
        child: SizedBox());
  }
}