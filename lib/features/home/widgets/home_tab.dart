import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: deviceHeight * 0.15,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: deviceHeight * 0.016,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: deviceHeight * 0.1,
                      width: deviceHeight * 0.1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: MyColors.storiesBorderGradientColors,
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              lightTheme.colorScheme.secondary.withOpacity(0.5),
                          width: 0.5,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(deviceHeight * 0.002),
                        child: Container(
                          margin: EdgeInsets.all(deviceHeight * 0.006),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightTheme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.008,
                    ),
                    SizedBox(
                      width: deviceWidth * 0.21,
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
                  width: deviceHeight * 0.016,
                );
              },
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: Color(0xFFDADADA),
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
    );
  }
}
