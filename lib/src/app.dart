import 'package:button_switch_ui/src/configs/themes.dart';
import 'package:button_switch_ui/src/theme_bloc/theme_bloc.dart';
import 'package:button_switch_ui/src/theme_bloc/theme_event.dart';
import 'package:button_switch_ui/src/theme_bloc/theme_state.dart';
import 'package:button_switch_ui/src/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        buildWhen: (previous, current) {
          if (current is ThemeUpdated && previous is ThemeUpdated) {
            return previous.mode != current.mode;
          }
          return current is ThemeUpdated && previous is! ThemeUpdated;
        },
        builder: (context, theme) {
          return MaterialApp(
            title: 'Flutter UI Button Switch',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light().data,
            darkTheme: AppTheme.dark().data,
            themeMode: theme is ThemeUpdated ? theme.mode : ThemeMode.light,
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Flutter - Switcher'),
              ),
              body: Center(
                child: CustomSwitch(
                  width: 150,
                  height: 60,
                  onTap: (value) {
                    context.read<ThemeBloc>().add(
                          OnChangeThemeEvent(
                            themeMode: value ? ThemeMode.light : ThemeMode.dark,
                          ),
                      );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
