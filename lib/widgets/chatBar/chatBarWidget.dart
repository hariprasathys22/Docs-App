import 'package:docs_ui/constants/button/button.dart';
import 'package:docs_ui/constants/customTextField/custom_text_field.dart';
import 'package:docs_ui/widgets/toggleButtonCheckBox/toggle_button_checkbox.dart';
import 'package:flutter/material.dart';

class Chatbarwidget extends StatelessWidget {
  const Chatbarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleController = ToggleController();
    final toggleImageController = ToggleController();
    final toggleCodeController = ToggleController();

    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromARGB(218, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(),
            SizedBox(height: 10), // Space between text field and button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleButtonCheckbox(
                  controller: toggleController,
                  label: "Brainstorm",
                  icon: Icons.lightbulb_outline_sharp,
                  color: const Color.fromARGB(255, 238, 195, 2),
                ),
                ToggleButtonCheckbox(
                  controller: toggleImageController,
                  label: "Image",
                  icon: Icons.image_outlined,
                  color: Colors.green,
                ),
                ToggleButtonCheckbox(
                  controller: toggleCodeController,
                  label: "Code",
                  icon: Icons.code_outlined,
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 10),
            Button(
              name: "New Chat",
              types: false,
              height: 45,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ],
        ),
      ),
    );
  }
}
