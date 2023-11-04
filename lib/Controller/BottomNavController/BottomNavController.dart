import 'package:flutter/material.dart';
import 'package:talqa_design/Model/BottomModel/BottomNav.dart';

class BottomNavController {
  List<LabelTextModel> labeltextlistOblect = [
    LabelTextModel(labelText: "الرئيسية", icon: Icons.home),
    LabelTextModel(labelText: "طلباتي", icon: Icons.outbox_rounded),
    LabelTextModel(labelText: "السلة", icon: Icons.card_travel),
    LabelTextModel(labelText: "المفصلة", icon: Icons.favorite),
    LabelTextModel(labelText: "الحساب", icon: Icons.person),
  ];
}
