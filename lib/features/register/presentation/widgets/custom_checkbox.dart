import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:brilloconnectz/core/utils/dimensions.dart';
import 'package:brilloconnectz/features/register/domain/entities/interest.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final InterestEntity value;
  final bool isSelected;
  final void Function() onTap;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const themeColor = BrilloColors.primary;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.small),
      decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : BrilloColors.white,
          borderRadius: BorderRadius.circular(Dimensions.small),
      ),
      child: ListTile(
        onTap: onTap,
        selectedColor: Colors.white,
        selectedTileColor: BrilloColors.primary,
        textColor: themeColor,
        selected: isSelected,
        leading: (){
          Color? color = isSelected ? Colors.white : value.color;

          if(value.iconData != null){
            return Icon(value.iconData, color: color,);
          }

          return null;
        }(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.small),
            side: const BorderSide(color: themeColor, width: 2.0)),
        title: Text(value.displayTitle!),
      ),
    );
  }
}
