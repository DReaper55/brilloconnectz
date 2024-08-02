import 'package:flutter/widgets.dart';

class InterestEntity {
  final String? name, displayTitle;
  final String? displayImage;
  final int? id;
  final IconData? iconData;
  final String? icon;
  final Color? color;

  const InterestEntity(
      {this.id,
        this.color,
        this.displayTitle,
        this.icon,
        this.displayImage,
        this.name,
        this.iconData});

  InterestEntity.fromMap(Map<dynamic, dynamic> list)
      : id = list['id'],
        name = list['name'],
        icon = list['icon'],
        displayImage = list['displayImage'],
        displayTitle = list['displayTitle'],
        color = list['color'],
        iconData = list['iconData'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'displayImage': displayImage,
      'displayTitle': displayTitle,
    };
  }
}
