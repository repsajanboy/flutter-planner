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
          Future.delayed(const Duration(seconds: 3)).then((value) {
            Navigator.pushReplacementNamed(context, RouteNames.main);
          });
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF4e54c8),
                Color(0xFF8f94fb),
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'plan your tasks and do it',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
