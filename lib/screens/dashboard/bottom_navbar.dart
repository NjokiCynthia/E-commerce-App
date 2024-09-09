import 'package:ecommerce/constants/color_constants.dart';
import 'package:ecommerce/products_variants.dart';
import 'package:ecommerce/screens/dashboard/items.dart';
import 'package:ecommerce/screens/dashboard/profile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    bottomNavigationController = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const ProductVariantsScreen(),
      const Items(),
      const Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Dashboard"),
        activeColorPrimary: primaryDarkColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.payments),
        title: ("Items"),
        activeColorPrimary: primaryDarkColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people_outline_outlined),
        title: ("Profile"),
        activeColorPrimary: primaryDarkColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: bottomNavigationController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardAppears: true,
        decoration: const NavBarDecoration(colorBehindNavBar: Colors.white),
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        navBarStyle: NavBarStyle.style1,
        onItemSelected: (value) {},
      ),
    );
  }
}
