import 'package:flutter/material.dart';

import './routing/app_router.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //FirebaseDatabase.instance.setPersistenceEnabled(true);
  runApp(
    MyApp(
      router: AppRouter(),
    ),
  );
}
