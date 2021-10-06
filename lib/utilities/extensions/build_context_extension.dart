import 'package:flutter/material.dart';
import 'package:project_pokemon/generated/l10n.dart';


extension BuildContextExtension on BuildContext {
  MediaQueryData get mquery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  S get s => S.of(this);
}
