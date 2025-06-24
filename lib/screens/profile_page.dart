import 'package:flutter/material.dart';
import 'package:docs_ui/widgets/NavigationWrapper/navigation_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationWrapper(
      initialIndex: 4, // Profile tab index
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline_rounded,
              size: 80,
              color: Color(0xffE500AC),
            ),
            SizedBox(height: 20),
            Text(
              'Profile Page',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your profile information will appear here',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
