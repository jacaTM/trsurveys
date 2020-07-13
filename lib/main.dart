import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Survey',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String> _loadLocalHTML() async {
    return await rootBundle.loadString('assets/tr.html');
  }

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) {
          return FutureBuilder<String>(
              future: _loadLocalHTML(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Scaffold(
                    appBar: AppBar(),
                    body: WebView(
                      initialUrl: Uri.dataFromString(
                        snapshot.data,
                        mimeType: 'text/html',
                        encoding: Encoding.getByName('utf-8'),
                      ).toString(),
                      javascriptChannels: jsChannels,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("${snapshot.error}"),
                    ),
                  );
                }
                return Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              });
        },
      },
    );
  }
}
