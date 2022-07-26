import 'package:flutter/material.dart';
import 'package:flutter_connectivity_plus/core/init/main_build.dart';
import 'package:flutter_connectivity_plus/product/network_change/no_network_widget.dart';
import 'package:flutter_connectivity_plus/view/network_change_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: NetworkChangeView(),
      builder: MainBuild.build,
    );
  }
}
