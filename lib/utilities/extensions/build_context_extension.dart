import 'package:flutter/material.dart';
import 'package:project_pokemon/generated/l10n.dart';

/// Get MediaQuery.of(context) as [context.mquery]
extension MediaQueryContext on BuildContext {
  MediaQueryData get mquery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  S get s => S.of(this);
}
