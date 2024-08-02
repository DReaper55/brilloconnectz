import 'dart:math';

import 'package:brilloconnectz/core/helpers/extensions.dart';
import 'package:brilloconnectz/core/services/navigation_services.dart';
import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/routes.dart';
import 'package:brilloconnectz/features/register/domain/entities/interest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final interestNotifierProvider =
    ChangeNotifierProvider((ref) => InterestNotifier(ref));

class InterestNotifier extends ChangeNotifier {
  final Ref ref;

  final interestInfoList = ValueNotifier<List<InterestEntity>>([]);
  final selectedInterestInfo = ValueNotifier<List<InterestEntity>>([]);

  final isEnabled = ValueNotifier(false);
  final isLoading = ValueNotifier(false);

  final tAndCCheckBox = ValueNotifier<bool>(false);

  InterestNotifier(this.ref);

  final interests = [
    'football', 'basketball', 'ice hockey', 'motorsports', 'bandy', 'rugby',
    'skiing', 'shooting'
  ];

  void setData() {
   List<InterestEntity> listOfInterests = [];

   for (String element in interests) {
     listOfInterests.add(InterestEntity(
       id: Random().nextInt(99999),
       displayTitle: element.capitalizeFirst(),
       name: element,
       color: BrilloColors.primary,
       iconData: _getIconData(element)
     ));
   }

   interestInfoList.value = listOfInterests;
   notifyListeners();
  }

  IconData? _getIconData(String sportName) {
    switch (sportName){
      case 'football': return Icons.sports_soccer;
      case 'basketball': return Icons.sports_basketball;
      case 'ice hockey': return Icons.sports_hockey;
      case 'motorsports': return Icons.pedal_bike_outlined;
      case 'bandy': null;
      case 'rugby': return Icons.sports_rugby;
      case 'skiing': return Icons.downhill_skiing;
      case 'shooting': return Icons.my_location;
      default: return null;
    }
    return null;
  }

  void toggleIsEnabled() {
    isEnabled.value = selectedInterestInfo.value.isNotEmpty && tAndCCheckBox.value;

    notifyListeners();
  }

  void toggleTAndCCheckBox() {
    tAndCCheckBox.value = !tAndCCheckBox.value;

    toggleIsEnabled();
  }

  toggleSelection(InterestEntity interestInfo) {
    final tempList = [...selectedInterestInfo.value];

    final foundSport = tempList.firstWhere((element) => element.id == interestInfo.id, orElse: () => const InterestEntity());

    if(foundSport.id != null){
      tempList.removeWhere((element) => element.id == interestInfo.id);
    } else {
      tempList.add(interestInfo);
    }

    selectedInterestInfo.value = tempList;
    toggleIsEnabled();
  }

  void displayTAndC() {
  }

  void register() {
    // Stub asynchronous registration

    isLoading.value = true;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 3000), () {
      isLoading.value = false;
      notifyListeners();
    });

    Future.delayed(const Duration(milliseconds: 4000), () {
      ref.read(navigationService).navigateToNamed(Routes.bottomNav);
    });

  }
}