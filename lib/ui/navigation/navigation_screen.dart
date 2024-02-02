import 'dart:io';

import 'package:animations/animations.dart';
import 'package:closet_assignment/ui/navigation/chat_screen.dart';
import 'package:closet_assignment/ui/navigation/discover_screen.dart';
import 'package:closet_assignment/ui/navigation/favorite_screen.dart';
import 'package:closet_assignment/ui/navigation/mycloset_screen.dart';
import 'package:closet_assignment/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  bool reverse = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const double _iconSize = 27.0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      DiscoverScreen(
        scaffoldKey: _scaffoldKey,
      ),
      ChatScreen(),
      FavoriteScreen(),
      MyClosetScreen(),
    ];
    final Color selectedColor = Theme.of(context).iconTheme.color!;
    final Color unselectedColor =
        Theme.of(context).iconTheme.color!.withOpacity(0.3);

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Hi Vaibhav!"),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Iconsax.user),
                title: Text('Followers'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Iconsax.tag_user),
                title: Text('Following'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Iconsax.presention_chart),
                title: Text('Suggested'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: Platform.isIOS ? 84 : kBottomNavbarHeight,
        padding: Platform.isIOS
            ? EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 7.7,
                right: MediaQuery.of(context).size.width / 7.7,
                bottom: 20)
            : EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 7.2),
        decoration: BoxDecoration(
          boxShadow: [kSubtleShadow],
          border: Border(top: BorderSide.none),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                reverse = false;
                _selectedIndex = 0;
              }),
              child: Icon(
                Iconsax.discover,
                size: _iconSize,
                color: _selectedIndex == 0 ? selectedColor : unselectedColor,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                reverse = _selectedIndex < 1 ? true : false;
                _selectedIndex = 1;
              }),
              child: Icon(
                Iconsax.messages,
                size: _iconSize,
                color: _selectedIndex == 1 ? selectedColor : unselectedColor,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                reverse = _selectedIndex < 2 ? true : false;
                _selectedIndex = 2;
              }),
              child: Icon(
                Iconsax.heart,
                size: _iconSize,
                color: _selectedIndex == 2 ? selectedColor : unselectedColor,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                reverse = _selectedIndex < 3 ? true : false;
                _selectedIndex = 3;
              }),
              child: Icon(
                Iconsax.profile_circle,
                size: _iconSize,
                color: _selectedIndex == 3 ? selectedColor : unselectedColor,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageTransitionSwitcher(
            reverse: !reverse,
            transitionBuilder: (Widget child,
                Animation<double> primaryAnimation,
                Animation<double> secondaryAnimation) {
              return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                child: child,
              );
            },
            child: Container(
              key: ValueKey(_selectedIndex),
              child: _pages[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
