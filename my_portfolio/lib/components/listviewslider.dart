import 'package:flutter/material.dart';

class ListViewSlider extends StatefulWidget {
  const ListViewSlider(
      {required this.children, required this.controller, Key? key})
      : super(key: key);

  final List<Widget?> children;

  final TransitionController controller;

  @override
  State<ListViewSlider> createState() => _ListViewSlider();
}

class _ListViewSlider extends State<ListViewSlider> {
  final _listViewController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      _listViewController.animateTo(
          (MediaQuery.of(context).size.height *
              widget.controller
                  ._currentIndex), // FIX this: way to get index so scrollview knows where to scroll to :)), // 100 is the height of container and index of 6th element is 5
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: _listViewController,
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        // ignore: unnecessary_null_comparison
        if (widget.children == null) {
          return const CircularProgressIndicator();
        }
        return Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(child: widget.children[index]));
      },
    );
  }
}

class TransitionController extends ChangeNotifier {
  var _currentIndex = 0;

  void scrollTo(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}
