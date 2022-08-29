import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routing/app_router_names.dart';
import '../../main_screen/sidebar/sidebar.dart';
import '../../theme/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SidebarBloc, SidebarState>(
      listener: (context, state) {
        if (state.status == SideBarStatus.success) {
          BlocProvider.of<ThemeBloc>(context).add(DefaultThemeLoaded());
          Navigator.pushReplacementNamed(context, RouteNames.main);
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
