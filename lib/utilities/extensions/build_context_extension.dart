import 'package:flutter/material.dart';

/// Get MediaQuery.of(context) as [context.mquery]
extension MediaQueryContext on BuildContext {
  MediaQueryData get mquery => MediaQuery.of(this);
}
