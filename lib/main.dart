import 'package:flutter/material.dart';
import 'package:kandy_casa_360/screens/about_us.dart';
import 'package:kandy_casa_360/screens/reservations.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ç',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '360° Kandy Casa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _webViewController;

  void _handleClick(String value) {
    switch (value) {
      case "Reservations":
        // Navigator.of(context).push(ReservationsPage());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReservationsPage()),
        );
        break;
      case "About Us":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutUsPage()),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _handleClick,
            itemBuilder: (BuildContext context) {
              return {'Reservations', 'About Us'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: WebView(
          initialUrl: 'https://kandy-casa-test.netlify.app/',
          gestureNavigationEnabled: false,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController c) {
            _webViewController = c;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _webViewController.reload();
        },
        child: Icon(Icons.home_outlined),
      ),
    );
  }
}
