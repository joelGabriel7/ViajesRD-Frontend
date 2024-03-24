import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required String message,
  String? actionLabel,
  VoidCallback? onActionPressed,
  Color? backgroundColor,
  Icon? icon,
}) {
  return SnackBar(
    content: Wrap(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const Icon(Icons.info_outline, color: Colors.white),
            const SizedBox(width: 10),
            // Añade Flexible para permitir que el texto se expanda
            Flexible(
              child: Text(message, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ],
    ),
    backgroundColor: backgroundColor ?? Colors.blue,

    action: (actionLabel != null && onActionPressed != null)
        ? SnackBarAction(
            label: actionLabel,
            textColor: Colors.white,
            onPressed: onActionPressed,
          )
        : null,

    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(8),
    // Ajusta la duración para que el usuario tenga tiempo de leer mensajes largos
    duration: const Duration(milliseconds: 600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}

// Función que muestra el SnackBar personalizado
void showCustomSnackBar({
  required BuildContext context,
  required String message,
  String? actionLabel,
  VoidCallback? onActionPressed,
  Color? backgroundColor,
  Icon? icon,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    customSnackBar(
      message: message,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      backgroundColor: backgroundColor,
      icon: icon,
    ),
  );
}
