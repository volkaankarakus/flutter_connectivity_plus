import 'package:flutter/material.dart';
import 'package:flutter_connectivity_plus/product/network_change/network_change_manager.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({super.key});

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final INetworkChangeManager _changeManager;
  NetworkResults? _networkResults;

  @override
  void initState() {
    super.initState();
    _changeManager = NetworkChangeManager();
    waitForScreenDrawing(() {
      _changeManager.handleNetworkChange((result) {
      _updateNetwork(result);
    });
    });
    
  }

  Future<void> fetchFirstResult() async {
    // Code to run after screen drawing is finished with WidgetsBinding
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _networkResults = await _changeManager.checkNetworkFirst();
      _updateNetwork(_networkResults);
    });
  }

  void _updateNetwork(NetworkResults? result) {
    setState(() {
      _networkResults = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Container(
          height: 70,
          color: Colors.red,
        ),
        secondChild: SizedBox(),
        crossFadeState: _networkResults == NetworkResults.off
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 500));
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreenDrawing(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
