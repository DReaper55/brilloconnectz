import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifiers/visibility_state.dart';

class EyeToggle extends ConsumerStatefulWidget {
  const EyeToggle({super.key});

  @override
  ConsumerState<EyeToggle> createState() => _EyeToggleState();
}

class _EyeToggleState extends ConsumerState<EyeToggle> {
  @override
  Widget build(BuildContext context) {
    final r = ref.read(visibilityProvider.state);
    final state = ref.watch(visibilityProvider.state);
    return InkWell(
        onTap: () => r.state = !r.state,
        child: state.state == true
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined));
  }
}
