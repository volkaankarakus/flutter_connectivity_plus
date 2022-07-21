import 'package:flutter/material.dart';

class NetworkChangeView extends StatefulWidget {
  const NetworkChangeView({super.key});

  @override
  State<NetworkChangeView> createState() => _NetworkChangeViewState();
}

class _NetworkChangeViewState extends State<NetworkChangeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Placeholder(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'Page1'),
      BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'Page2'),
    ]);
  }
}
