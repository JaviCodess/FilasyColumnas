import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _itemCount = 10;
  int filas = 1;
  int columnas = 1;

  PageController _filasController;
  PageController _columnasController;
  @override
  void initState() {
    super.initState();
    _filasController = PageController();
    _columnasController = PageController();
    _filasController.addListener(() => _establecerFC());
    _columnasController.addListener(() => _establecerFC());
  }

  _establecerFC() {
    setState(() {
      filas = _filasController.page.floor() + 1;
      columnas = _columnasController.page.floor() + 1;
      print('$filas, $columnas');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
              child: PageView.builder(
                controller: _filasController,
                itemBuilder: (context, page) {
                  return Center(
                    child: Text('${page + 1}'),
                  );
                },
                itemCount: 10,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 60,
              child: PageView.builder(
                  controller: _columnasController,
                  itemBuilder: (context, page) {
                    return Center(
                      child: Text('${page + 1}'),
                    );
                  }),
            ),
            /*Expanded(
              flex: 10,
              child: Row(
                children: List.generate(filas, (index) {
                  return Column(
                    children: List.generate(columnas, (index2) {
                      return Container(

                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Text('$index2' + '$index'),
                      );
                    }),
                  );
                }),
              ),
            ),*/
            for (var index = 0; index < filas; index++)
              Expanded(
                //flex: fflex[f],
                child: Row(children: [
                  for (var index2 = 0; index2 < columnas; index2++)
                    Expanded(
                      //flex: cflex[f][c],
                      child: Text('$index$index2'),
                    )
                ]),
              ),
          ],
        ),
      ),
    );
  }
}
