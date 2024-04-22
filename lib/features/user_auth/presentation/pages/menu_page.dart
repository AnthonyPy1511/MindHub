import 'package:flutter/material.dart';
import 'package:mindhub/features/user_auth/presentation/pages/chats_page.dart';
import 'package:mindhub/features/user_auth/presentation/pages/home_dashboard_page1.dart';
import 'package:mindhub/features/user_auth/presentation/pages/resources_page.dart';
import 'package:mindhub/features/user_auth/presentation/pages/more_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: PersistentTabController(),
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeDash1(),
      // RecentPage(),
      const ChatsPage(),
      const ResourcesPage(),
      const MorePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Inicio",
        activeColorPrimary: const Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/HomeDash',
          routes: {'/HomeDash': (context) => const HomeDash1()},
        ),
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.pending_actions),
      //   title: "Historial",
      //   activeColorPrimary: Color.fromRGBO(7, 185, 159, 1),
      //   inactiveColorPrimary: Colors.grey,
      //   routeAndNavigatorSettings: RouteAndNavigatorSettings(
      //     initialRoute: '/history',
      //     routes: {'/history': (context) => Container()},
      //   ),
      // ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat),
        title: "Chats",
        activeColorPrimary: const Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/history',
          routes: {'/history': (context) => Container()},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.eco),
        title: "Recursos",
        activeColorPrimary: const Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/conversations',
          routes: {'/conversations': (context) => Container()},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.pending),
        title: "Más",
        activeColorPrimary: const Color.fromRGBO(7, 185, 159, 1),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/MorePage',
          routes: {'/MorePage': (context) => const MorePage()},
        ),
      ),
    ];
  }
}
