import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String? cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const AppDialog({
    required this.title,
    required this.message,
    required this.confirmText,
    required this.onConfirm,
    super.key,
    this.cancelText,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: Text(message),
      actions: [
        if (cancelText != null)
          TextButton(
              onPressed: onCancel ?? () => Navigator.pop(context),
              child: Text(cancelText!)),
        ElevatedButton(onPressed: onConfirm, child: Text(confirmText)),
      ],
    );
  }
}
