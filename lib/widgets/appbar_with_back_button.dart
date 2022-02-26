import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fishies_sih/utils/colors.dart' as colors;

class AppBarBackButton extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBackButton(this.title, {Key? key, this.actions})
      : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// Widget for app bars with a back button
  ///
  /// @param:
  /// String title: title to be displayed in app bar
  ///
  /// @returns:
  /// Widget: Returns an AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //TODO: Find way to get the gradient in background color to continue here
      backgroundColor: colors.scaffoldColor,
      leading: IconButton(
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: actions ?? [],
      centerTitle: true,
      title: Text(
        title.toUpperCase(),
        style: GoogleFonts.nunito(color: colors.primaryTextColor, fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }
}
