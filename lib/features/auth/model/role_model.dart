import 'package:flutter/material.dart';

enum RoleType { buyer, farmer }

class RoleModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final RoleType role;

  const RoleModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.role,
  });
}

final List<RoleModel> roles = [
  RoleModel(
    title: "Buyer",
    subtitle: "Shop fresh local goods",
    icon: Icons.shopping_basket,
    role: RoleType.buyer,
  ),
  RoleModel(
    title: "Farmer",
    subtitle: "Sell your harvest",
    icon: Icons.agriculture,
    role: RoleType.farmer,
  ),
];
