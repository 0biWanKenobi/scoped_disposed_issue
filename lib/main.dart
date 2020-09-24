import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scoped_disposed_issue/bool_widget.dart';
import 'package:scoped_disposed_issue/page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final isZeroProvider =
    Provider.autoDispose.family<bool, int>((_, val) => val == 0);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/page': (_) => ProviderScope(
            overrides: [usedByTextScopedProvider.overrideWithValue(0)],
            child: PageScreen())
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const BoolWidget(),
            RaisedButton(
              child: Text('Should throw when going back'),
              onPressed: () => Navigator.of(context).pushNamed('/page'),
            ),
          ],
        ),
      ),
    );
  }
}
