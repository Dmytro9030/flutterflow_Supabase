import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCX-tCAYiS52lKt1D88IrQrc3JBbEc6rfE",
            authDomain: "safe-blu-service-app-fyo7o6.firebaseapp.com",
            projectId: "safe-blu-service-app-fyo7o6",
            storageBucket: "safe-blu-service-app-fyo7o6.appspot.com",
            messagingSenderId: "778096646436",
            appId: "1:778096646436:web:e755f8c76cad07e62dfbb1"));
  } else {
    await Firebase.initializeApp();
  }
}
