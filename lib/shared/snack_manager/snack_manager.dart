import 'package:flutter/material.dart';

class SnackBarManager {
  _show({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color iconColor,
    backgroundColor = Colors.white,
  }) {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showError({required BuildContext context, required String message}) => _show(
        context: context,
        message: message,
        icon: Icons.warning_rounded,
        iconColor: Colors.red,
      );

  showWarning({required BuildContext context, required String message}) =>
      _show(
        context: context,
        message: message,
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.yellow,
      );

  showSuccess({required BuildContext context, required String message}) =>
      _show(
        context: context,
        message: message,
        icon: Icons.check_circle_outline,
        iconColor: Colors.green,
        backgroundColor: Colors.green[100],
      );
}
