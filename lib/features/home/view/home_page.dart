import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/widgets/add_content_tab.dart';
import 'package:instagram_clone/features/home/widgets/home_tab.dart';
import 'package:instagram_clone/features/home/widgets/profile_tab.dart';
import 'package:instagram_clone/features/home/widgets/reels_tab.dart';
import 'package:instagram_clone/features/home/widgets/search_tab.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class HomePage extends StatefulWidget {
  static final routeName = '/';

  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedNavIndex;

  @override
  void initState() {
    super.initState();
    selectedNavIndex = 0;
  }

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    AddContentTab(),
    ReelsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint(
      'device dimensions (width, height): '
      '($deviceWidth, $deviceHeight)',
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          Constants.appName,
          style: lightTheme.textTheme.displayLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: Constants.notifications,
            icon: SvgPicture.asset(
              Constants.pathToLikeUnselectedLightThemeSvg,
            ),
          ),
          IconButton(
            onPressed: () {},
            tooltip: Constants.messages,
            icon: SvgPicture.asset(
              Constants.pathToMessengerLightThemeSvg,
            ),
          ),
        ],
      ),
      body: tabs[selectedNavIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFDADADA),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: NavigationBar(
          height: deviceHeight * 0.065,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          shadowColor: Colors.transparent,
          overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
          surfaceTintColor: Colors.transparent,
          indicatorColor: Colors.white,
          selectedIndex: selectedNavIndex,
          onDestinationSelected: (index) => setState(() {
            selectedNavIndex = index;
          }),
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                Constants.pathToHomeUnselectedLightThemeSvg,
              ),
              selectedIcon: SvgPicture.asset(
                Constants.pathToHomeSelectedLightThemeSvg,
              ),
              label: Constants.home,
              tooltip: Constants.home,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                Constants.pathToSearchUnselectedLightThemeSvg,
              ),
              selectedIcon: SvgPicture.asset(
                Constants.pathToSearchSelectedLightThemeSvg,
              ),
              label: Constants.search,
              tooltip: Constants.search,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                Constants.pathToAddPostLightThemeSvg,
              ),
              label: Constants.post,
              tooltip: Constants.post,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                Constants.pathToReelsMenuUnselectedLightThemeSvg,
              ),
              selectedIcon: SvgPicture.asset(
                Constants.pathToReelsMenuSelectedLightThemeSvg,
              ),
              label: Constants.reels,
              tooltip: Constants.reels,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                Constants.pathToProfileUnselectedLightThemeSvg,
              ),
              selectedIcon: SvgPicture.asset(
                Constants.pathToProfileSelectedLightThemeSvg,
              ),
              label: Constants.profile,
              tooltip: Constants.profile,
            ),
          ],
        ),
      ),
    );
  }
}
