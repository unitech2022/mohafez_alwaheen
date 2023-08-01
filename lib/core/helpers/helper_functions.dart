import 'dart:io';

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

pushPage(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

pop(context) {
  Navigator.pop(context);
}

pushPageRoutName(context, route) {
  Navigator.pushNamed(
    context,
    route,
  );
}

pushPageRoutNameReplaced(context, route) {
  Navigator.pushReplacementNamed(
    context,
    route,
  );
}

widthScreen(context) => MediaQuery.of(context).size.width;

heightScreen(context) => MediaQuery.of(context).size.height;

SizedBox sizedHeight(double height) => SizedBox(
      height: height,
    );
SizedBox sizedWidth(double width) => SizedBox(
      width: width,
    );

showTopMessage({context, customBar}) {
  showTopSnackBar(
    Overlay.of(context),
    customBar,
  );
}

Future<void> launchUrlFunction(link) async {
  if (!await launchUrl(Uri.parse(link),mode: LaunchMode.externalApplication)) {
    await launchUrl(Uri.parse("https://play.google.com/store/search?q=zoom&c=apps"));
  }
}
//     FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
// void firebaseCloudMessaging_Listeners() {

//   if (Platform.isIOS) {
//     _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//   }

//   _firebaseMessaging.getToken().then((token){
//     AppModel.deviceToken=token!;
//     print(AppModel.deviceToken);
//   });

// }

Future<void> showMyDialog({context, title, body, founction}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    body,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("الغاء",
                style: TextStyle(fontSize: 14, color: Colors.black)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("تغيير",
                style: TextStyle(fontSize: 16, color: Colors.black)),
            onPressed: founction,
          ),
        ],
      );
    },
  );
}
