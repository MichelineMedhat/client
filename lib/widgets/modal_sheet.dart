import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/locale_bloc/bloc.dart';
import '../blocs/theme_bloc/bloc.dart';
import '../widgets/modal_tile.dart';

class ModalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localeBloc = BlocProvider.of<LocaleBloc>(context);
    var themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Container(
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ModalTile(
              textKey: 'switch_language',
              icon: Icons.language,
              onTap: () {
                if (localeBloc.currentState is EnglishLocale) {
                  localeBloc.dispatch(LocaleEvent.Arabic);
                } else if (localeBloc.currentState is ArabicLocale) {
                  localeBloc.dispatch(LocaleEvent.English);
                }
                Navigator.pop(context);
              },
            ),
            ModalTile(
              textKey: 'switch_theme',
              icon: Icons.invert_colors,
              onTap: () {
                if (themeBloc.currentState is PrimaryTheme) {
                  themeBloc.dispatch(ThemeEvent.Black);
                } else if (themeBloc.currentState is BlackTheme) {
                  themeBloc.dispatch(ThemeEvent.Primary);
                }
                Navigator.pop(context);
              },
            ),
            ModalTile(
              textKey: 'help',
              icon: Icons.help_outline,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ModalTile(
              textKey: 'send_feedback',
              icon: Icons.feedback,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
