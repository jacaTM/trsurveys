import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Survey',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
        print('JOKER');
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
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  StreamSubscription _onDestroy;

  Future<String> _loadLocalHTML() async {
    return await rootBundle.loadString('assets/tr.html');
  }

  @override
  void initState() {
    super.initState();
    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
      if (mounted) {
        print('webview destroyed');
      }
    });
  }

  @override
  void dispose() {
    _onDestroy.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        flutterWebViewPlugin.evalJavascript("onReward(data)");
                      },
                    ),
                    body: WebviewScaffold(
                      url: Uri.dataFromString(
                        snapshot.data,
                        mimeType: 'text/html',
                        encoding: Encoding.getByName('utf-8'),
                      ).toString(),
                      javascriptChannels: jsChannels,
                      appCacheEnabled: true,
                      withJavascript: true,
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
