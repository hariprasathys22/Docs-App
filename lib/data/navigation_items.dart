import 'package:flutter/material.dart';

class NavigationItem {
  final IconData icon;
  final String label;

  const NavigationItem({required this.icon, required this.label});
}

// Navigation items data
final List<NavigationItem> navigationItems = [
  const NavigationItem(icon: Icons.home_filled, label: 'Home'),
  const NavigationItem(
    icon: Icons.chat_bubble_outline_rounded,
    label: 'Messages',
  ),
  const NavigationItem(icon: Icons.mic_none_rounded, label: 'Voice'),
  const NavigationItem(icon: Icons.bookmark_border_rounded, label: 'Saved'),
  const NavigationItem(icon: Icons.person_outline_rounded, label: 'Profile'),
];
