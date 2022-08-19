import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './routing/app_router.dart';
import './networking/api_client.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(
      apiClient: ApiClient(),
      router: AppRouter(),
    ),
  );
}
