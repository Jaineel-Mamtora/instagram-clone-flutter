import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    debugPrint(
      'device dimensions (width, height): '
      '(${media.size.width}, ${media.size.height})',
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: media.size.height * 0.15,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: media.size.height * 0.016,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: media.size.height * 0.1,
                        width: media.size.height * 0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: MyColors.storiesBorderGradientColors,
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: lightTheme.colorScheme.secondary
                                .withOpacity(0.5),
                            width: 0.5,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.all(media.size.height * 0.002),
                          child: Container(
                            margin: EdgeInsets.all(media.size.height * 0.006),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: lightTheme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.size.height * 0.008,
                      ),
                      SizedBox(
                        width: media.size.width * 0.21,
                        child: Center(
                          child: Text(
                            index == 0 ? 'Your Story' : 'Story $index',
                            style: lightTheme.textTheme.labelSmall?.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) {
                  return SizedBox(
                    width: media.size.height * 0.016,
                  );
                },
              ),
            ),
            Divider(
              thickness: 0.1,
              height: 0.1,
              color: lightTheme.colorScheme.secondary,
            ),
            ListView.builder(
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  color: (index % 2 != 0)
                      ? lightTheme.colorScheme.primary
                      : Colors.white,
                );
              },
            )
          ],
        ),
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
