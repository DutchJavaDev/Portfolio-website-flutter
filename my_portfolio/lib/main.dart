import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/slides/landing_slide.dart';

import 'components/listviewslider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var defaultBackgroundColor = const Color.fromARGB(255, 22, 40, 72);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(button: GoogleFonts.robotoMono()),
        scaffoldBackgroundColor: defaultBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: defaultBackgroundColor,
        ),
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _headers = ["Landing", "Projects", "Experience", "About me"];

  final _controller = ScrollController();
  final _transitionController = TransitionController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_title = _headers[_transitionController.];
    var mWidth = MediaQuery.of(context).size.width;
    var mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () => _transitionController.scrollTo(0),
                child: const Center(
                    child: Text(
                  "B",
                  style: TextStyle(fontSize: 25),
                )))),
        centerTitle: true,
        title: const Text("need to make this changeable"),
        actions: [
          for (var i = 1; i < _headers.length; i++)
            TextButton(
                onPressed: () => _transitionController.scrollTo(i),
                child: Text(
                  _headers[i],
                  style: const TextStyle(
                    fontSize: 18,
                    shadows: [
                      Shadow(color: Colors.white, offset: Offset(0, -10))
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 4,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                )),
        ],
      ),
      body: ListViewSlider(
        children: [
          Landing(),
          for (var i = 1; i < _headers.length; i++)
            SizedBox(
              width: mWidth,
              height: mHeight,
              child: Center(
                child: Text(_headers[i]),
              ),
            )
        ],
        controller: _transitionController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _transitionController.scrollTo(0),
        tooltip: 'Go up',
        child: const Icon(Icons.arrow_upward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
