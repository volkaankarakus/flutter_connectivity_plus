import 'package:flutter/material.dart';

import '../../product/network_change/no_network_widget.dart';

class MainBuild {
  //Static Singleton, no one can generate a value from this widget
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox(),
        ),
        const NoNetworkWidget(),
      ],
    );
  }
}
