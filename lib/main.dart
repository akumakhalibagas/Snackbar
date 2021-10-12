import 'package:device_preview/device_preview.dart';
import 'package:flash/flash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: kIsWeb,
        builder: (context) => App(),
      ),
    );

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      title: 'Flash Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flash Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'TUGAS KK3 BU IIS',
            style: TextStyle(fontSize: 18.0, wordSpacing: 5.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Overlay(
              initialEntries: [
                OverlayEntry(builder: (context) {
                  return FlashPage();
                }),
              ],
            );
          }));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class FlashPage extends StatefulWidget {
  @override
  _FlashPageState createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Flash Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            '⚡️Hallo aku Bagas Makhali, Saya ditugasi membuat snackbar oleh bu iis dan ini hasilnya',
            style: TextStyle(fontSize: 18.0, wordSpacing: 5.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomFlash(persistent: false),
        child: Icon(Icons.info_outline),
      ),
    );
  }

  void _showBottomFlash({
    bool persistent = true,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    showFlash(
      context: context,
      persistent: persistent,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          margin: margin,
          behavior: FlashBehavior.fixed,
          position: FlashPosition.bottom,
          borderRadius: BorderRadius.circular(8.0),
          borderColor: Colors.blue,
          boxShadows: kElevationToShadow[8],
          backgroundGradient: RadialGradient(
            colors: [Colors.amber, Colors.black87],
            center: Alignment.topLeft,
            radius: 2,
          ),
          onTap: () => controller.dismiss(),
          forwardAnimationCurve: Curves.easeInCirc,
          reverseAnimationCurve: Curves.bounceIn,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: FlashBar(
              title: Text('Hello NGAB'),
              content: Text('Apakah Bagas Makhali Ganteng?'),
              indicatorColor: Colors.red,
              icon: Icon(Icons.info_outline),
              primaryAction: TextButton(
                onPressed: () => controller.dismiss(),
                child: Text('DISMISS'),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () => controller.dismiss('Yes, I do!'),
                    child: Text('YAA')),
                TextButton(
                    onPressed: () => controller.dismiss('No, I do not!'),
                    child: Text('TIDAK')),
              ],
            ),
          ),
        );
      },
    ).then((_) {});
  }
}
