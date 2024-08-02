import 'package:brilloconnectz/features/register/domain/entities/interest.dart';
import 'package:brilloconnectz/features/register/presentation/notifiers/interest_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileNotifierProvider =
    ChangeNotifierProvider((ref) => ProfileNotifier(ref));

class ProfileNotifier extends ChangeNotifier {
  final Ref ref;

  final interestInfoList = ValueNotifier<List<InterestEntity>>([]);

  ProfileNotifier(this.ref);

  void setData() {
    if(interestInfoList.value.isNotEmpty) return;

    final interestNotifier = ref.read(interestNotifierProvider.notifier);
    interestNotifier.setData();
    interestInfoList.value = [...interestNotifier.interestInfoList.value];
    notifyListeners();
  }
}