import 'package:flutter/material.dart';
import 'package:docs_ui/widgets/NavigationWrapper/navigation_wrapper.dart';

class VoicePage extends StatelessWidget {
  const VoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationWrapper(
      initialIndex: 2, // Voice tab index
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mic_none_rounded, size: 80, color: Color(0xffE500AC)),
            SizedBox(height: 20),
            Text(
              'Voice Page',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Voice recordings will appear here',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
