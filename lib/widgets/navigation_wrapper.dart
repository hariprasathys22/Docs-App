import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:docs_ui/widgets/custom_bottom_navigation_bar.dart';

class NavigationWrapper extends StatefulWidget {
  final Widget child;
  final int initialIndex;

  const NavigationWrapper({
    super.key,
    required this.child,
    this.initialIndex = 0,
  });

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens based on index
    switch (index) {
      case 0:
        Get.offNamed('/home');
        break;
      case 1:
        Get.offNamed('/messages');
        break;
      case 2:
        Get.offNamed('/voice');
        break;
      case 3:
        Get.offNamed('/saved');
        break;
      case 4:
        Get.offNamed('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getAppBarTitle(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        selectedColor: const Color(0xffE500AC),
        unselectedColor: Colors.grey[600]!,
        selectedBackgroundColor: Colors.grey[200]!,
      ),
    );
  }

  Text _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return const Text('Home');
      case 1:
        return const Text('Messages');
      case 2:
        return const Text('Voice');
      case 3:
        return const Text('Saved');
      case 4:
        return const Text('Profile');
      default:
        return const Text('App');
    }
  }
}
