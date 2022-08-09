import 'package:flutter/material.dart';

import './routing/app_router.dart';
import './networking/api_client.dart';
import 'app.dart';

void main() {
  runApp(
    MyApp(
      apiClient: ApiClient(),
      router: AppRouter(),
    ),
  );
}
