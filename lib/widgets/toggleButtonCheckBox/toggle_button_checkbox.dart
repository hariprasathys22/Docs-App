import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleController extends GetxController {
  var isSelected = false.obs;

  void toggle() => isSelected.value = !isSelected.value;
}

class ToggleButtonCheckbox extends StatelessWidget {
  final ToggleController controller;
  final String label;
  final IconData icon;
  final Color? color;

  const ToggleButtonCheckbox({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => TextButton.icon(
          onPressed: controller.toggle,
          icon: Icon(
            icon,
            color: controller.isSelected.value ? Colors.purple : color,
          ),
          label: Text(label),
          style: TextButton.styleFrom(
            backgroundColor:
                controller.isSelected.value
                    ? const Color.fromARGB(255, 247, 212, 238)
                    : const Color.fromARGB(40, 228, 207, 207),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
