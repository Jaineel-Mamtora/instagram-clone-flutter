import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class HomePage extends StatefulWidget {
  static final routeName = '/home';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 5,
        currentIndex: selectedNavIndex,
        enableFeedback: true,
        onTap: (index) {
          setState(() {
            selectedNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Constants.pathToHomeUnselectedLightThemeSvg,
            ),
            activeIcon: SvgPicture.asset(
              Constants.pathToHomeSelectedLightThemeSvg,
            ),
            label: Constants.home,
            tooltip: Constants.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Constants.pathToSearchUnselectedLightThemeSvg,
            ),
            activeIcon: SvgPicture.asset(
              Constants.pathToSearchSelectedLightThemeSvg,
            ),
            label: Constants.search,
            tooltip: Constants.search,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Constants.pathToAddPostLightThemeSvg,
            ),
            label: Constants.post,
            tooltip: Constants.post,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Constants.pathToReelsMenuUnselectedLightThemeSvg,
            ),
            activeIcon: SvgPicture.asset(
              Constants.pathToReelsMenuSelectedLightThemeSvg,
            ),
            label: Constants.reels,
            tooltip: Constants.reels,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Constants.pathToProfileUnselectedLightThemeSvg,
            ),
            activeIcon: SvgPicture.asset(
              Constants.pathToProfileSelectedLightThemeSvg,
            ),
            label: Constants.profile,
            tooltip: Constants.profile,
          ),
        ],
      ),
    );
  }
}
