import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onImagePressed;
  final VoidCallback? onMicPressed;

  const CustomTextField({
    super.key,
    this.controller,
    this.onImagePressed,
    this.onMicPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Type the message', // The hint text as seen in the image
        hintStyle: const TextStyle(
          color: Colors.grey,
        ), // Style for the hint text
        filled: true,
        fillColor:
            Colors.grey[100], // Light grey background color for the text field
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ), // Padding inside the text field
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
          borderSide:
              BorderSide
                  .none, // No border line, using fillColor for the background
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none, // No border when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.5,
          ), // A subtle blue border when focused
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ), // Add some padding to the right of the icons
          child: Row(
            mainAxisSize: MainAxisSize.min, // Make the row take minimum space
            children: [
              IconButton(
                icon: const Icon(
                  Icons.image_outlined,
                  color: Colors.grey,
                ), // Image icon
                onPressed: onImagePressed,
              ),
              IconButton(
                icon: const Icon(
                  Icons.mic_none,
                  color: Colors.grey,
                ), // Microphone icon
                onPressed: onMicPressed,
              ),
            ],
          ),
        ),
      ),
      // Optional: Add a TextEditingController to manage text input
      // controller: TextEditingController(),
      keyboardType: TextInputType.text, // Type of keyboard to display
      textInputAction: TextInputAction.send, // Action button on the keyboard
      onSubmitted: (text) {
        print('Message sent: $text');
        // You can handle sending the message here
      },
    );
    ;
  }
}
