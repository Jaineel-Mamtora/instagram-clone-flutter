import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget();

  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(
      color: lightTheme.colorScheme.primary,
      strokeWidth: 3,
    ),
  );
}

class LoaderManager {
  LoaderManager._sharedInstance();
  static final LoaderManager _shared = LoaderManager._sharedInstance();
  factory LoaderManager() => _shared;
  OverlayEntry? _overlayEntry;

  void showLoader(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder:
          (BuildContext context) => Container(
            width: deviceWidth,
            height: deviceHeight,
            color: Colors.white60,
            child: LoaderWidget(),
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideLoader() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
  }
}
