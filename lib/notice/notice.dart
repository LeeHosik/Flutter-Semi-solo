import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Notice_main extends StatelessWidget {
  const Notice_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35.0),
        child: AppBar(
          title: const Text(
            'Notice',
          ),
        ),
      ),
      body: Notice_mainBody(),
    );
  }
}

class Notice_mainBody extends StatefulWidget {
  const Notice_mainBody({super.key});

  @override
  State<Notice_mainBody> createState() => _Notice_mainBodyState();
}

class _Notice_mainBodyState extends State<Notice_mainBody> {
  late WebViewController controller;
  late bool isLoading;
  late String siteName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('1');
    isLoading = true; // for indicator
    // siteName = "m.cafe.naver.com/luchesia";
    siteName = "gametora.com/ja/umamusume";
    print('2');
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              isLoading = true;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse("https://$siteName"));
    // print('3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          backProcess(context);
        },
      ),
    );
  }

  // --- functions
  Future<bool> backProcess(BuildContext context) async {
    if (await controller.canGoBack()) {
      controller.goBack();
    } else {
      snackBarFunction(context);
      return Future.value(false);
    }
    return Future.value(true);
  }

  snackBarFunction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('처음화면 입니다'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
