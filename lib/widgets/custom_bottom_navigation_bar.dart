import 'package:flutter/material.dart';
import 'package:docs_ui/data/navigation_items.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color selectedColor;
  final Color unselectedColor;
  final Color backgroundColor;
  final Color selectedBackgroundColor;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.selectedColor = const Color(0xffE500AC),
    this.unselectedColor = const Color(0xFF757575),
    this.backgroundColor = Colors.white,
    this.selectedBackgroundColor = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(35, 0, 35, 30),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            navigationItems.length,
            (index) => _buildNavigationItem(index),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem(int index) {
    final bool isSelected = selectedIndex == index;
    final NavigationItem item = navigationItems[index];

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration:
            isSelected
                ? BoxDecoration(
                  color: selectedBackgroundColor,
                  shape: BoxShape.circle,
                )
                : null,
        padding: const EdgeInsets.all(12),
        child: Icon(
          item.icon,
          size: 24,
          color: isSelected ? selectedColor : unselectedColor,
        ),
      ),
    );
  }
}
