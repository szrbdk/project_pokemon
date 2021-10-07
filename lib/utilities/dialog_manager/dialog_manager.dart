import 'package:flutter/material.dart';
import 'package:project_pokemon/generated/l10n.dart';

class DialogManager {
  AlertDialog _basicDialog({
    required BuildContext context,
    required Widget title,
    required List<Widget> content,
    required bool addDefaultButton,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: title,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: content,
        ),
      ),
      actions: [
        if (addDefaultButton) ...[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).okey),
          ),
        ]
      ],
    );
  }

  AlertDialog simpleLoadingDialog({
    required BuildContext context,
    required Widget loadingMessage,
  }) {
    return _basicDialog(
      context: context,
      title: Text(S.of(context).please_wait),
      content: [
        loadingMessage,
        const SizedBox(height: 10),
        const CircularProgressIndicator(),
      ],
      addDefaultButton: false,
    );
  }

  AlertDialog simpleStatusDialog({
    required BuildContext context,
    required bool isSuccess,
    required List<Widget> content,
  }) {
    return _basicDialog(
      context: context,
      title: Text(isSuccess ? S.of(context).successful : S.of(context).failed),
      content: content,
      addDefaultButton: true,
    );
  }

  AlertDialog simpleErrorDialog({
    required BuildContext context,
    required dynamic error,
  }) {
    return _basicDialog(
      context: context,
      title: Text(S.of(context).error),
      content: [Text('$error')],
      addDefaultButton: true,
    );
  }
}
