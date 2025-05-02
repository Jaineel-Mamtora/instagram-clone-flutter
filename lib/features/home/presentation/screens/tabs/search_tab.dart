import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram_clone/common/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder:
            (_, _) => [
              SliverAppBar(
                bottom: PreferredSize(
                  preferredSize: Size(deviceWidth, 1),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: lightTheme.colorScheme.secondary.withValues(
                      alpha: 0.2,
                    ),
                  ),
                ),
                snap: true,
                floating: true,
                automaticallyImplyLeading: false,
                surfaceTintColor: Colors.transparent,
                centerTitle: false,
                title: CustomTextFormField(
                  filled: true,
                  hasBorder: false,
                  fillColor: MyColors.fillColor,
                  size: InputSize.small,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      Constants.pathToSearchUnselectedLightThemeSvg,
                    ),
                  ),
                  validator: (_) => null,
                  controller: _searchController,
                  hintText: 'Search',
                ),
              ),
            ],
        body: Container(),
      ),
    );
  }
}
