import 'package:logger/logger.dart';

/// Logger global para toda la aplicación.
/// Úsalo en lugar de `print()` para tener logs con colores, niveles y timestamps.
///
/// Ejemplo de uso:
/// ```dart
/// appLogger.i('Usuario autenticado correctamente');
/// appLogger.e('Error al cargar datos: $error');
/// ```
final appLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0, // No muestra el stack trace en logs normales
    errorMethodCount: 5, // Muestra 5 líneas de stack en errores
    lineLength: 120,
    colors: true, // Usa colores en consola (útil en desarrollo)
    printEmojis: true, // Agrega emojis para identificar rápido el nivel
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
  level: Level.debug, // En producción, cambia a Level.warning o Level.error
);
