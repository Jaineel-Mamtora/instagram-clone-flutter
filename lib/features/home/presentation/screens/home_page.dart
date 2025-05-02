import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import 'package:instagram_clone/features/home/bloc/home_event.dart';
import 'package:instagram_clone/features/home/presentation/screens/tabs/add_content_tab.dart';
import 'package:instagram_clone/features/home/presentation/screens/tabs/home_tab.dart';
import 'package:instagram_clone/features/home/presentation/screens/tabs/profile_tab.dart';
import 'package:instagram_clone/features/home/presentation/screens/tabs/reels_tab.dart';
import 'package:instagram_clone/features/home/presentation/screens/tabs/search_tab.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class HomePage extends StatelessWidget {
  static final routeName = '/';

  HomePage({super.key});

  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    AddContentTab(),
    ReelsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, int>(
      builder: (_, index) {
        return Scaffold(
          body: tabs[index],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: lightTheme.colorScheme.secondary.withValues(
                    alpha: 0.2,
                  ),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: NavigationBar(
              height: deviceHeight * 0.06,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              shadowColor: Colors.transparent,
              overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
              surfaceTintColor: Colors.transparent,
              indicatorColor: Colors.white,
              selectedIndex: index,
              onDestinationSelected:
                  (index) => context.read<TabBloc>().add(
                    ChangeHomeTabIndex(index: index),
                  ),
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
                  icon: SvgPicture.asset(Constants.pathToAddPostLightThemeSvg),
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
      },
    );
  }
}
