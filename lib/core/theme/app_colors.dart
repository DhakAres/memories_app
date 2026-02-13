import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_colors.g.dart';

/// Colores de la aplicación organizados semánticamente según su uso.
///
/// **Paleta de marca (tu diseño original):**
/// - brandPrimary: Azul intenso - acciones principales, marca
/// - brandAccent: Azul brillante - highlights, estados activos
/// - backgroundLight: Azul pastel - fondo principal de pantallas
/// - surfaceDark: Gris oscuro - tarjetas elevadas o texto principal
///
/// **Colores funcionales (sistema):**
/// - error, success, warning: estados de validación
/// - surfaceWhite: superficies elevadas (cards, modals)
/// - textPrimary, textSecondary, textOnBrand: jerarquía de texto
enum ColorsName {
  // Fondos
  backgroundLight, // Fondo principal de pantallas (Scaffold)
  surfaceDark, // Tarjetas/modals con contraste alto
  surfaceWhite, // Superficies elevadas sobre backgroundLight
  // Marca y acciones
  brandPrimary, // Color principal de marca (botones, AppBar, links)
  brandAccent, // Color de acento (chips, badges, highlights)
  // Textos
  textPrimary, // Texto principal (alta legibilidad)
  textSecondary, // Subtítulos, hints, labels secundarios
  textOnBrand, // Texto sobre brandPrimary/brandAccent (blanco)
  // Estados funcionales
  error, // Errores, validaciones fallidas
  success, // Confirmaciones, estados exitosos
  warning, // Avisos, alertas
}

// ========== PALETA ACTIVA: CÁLIDA NOSTÁLGICA REFINADA ==========
// Evoca los tonos de fotos impresas con mayor contraste y elegancia
Map<ColorsName, Color> _lightColors = {
  // Fondos - Jerarquía clara entre niveles
  ColorsName.backgroundLight: const Color(
    0xFFFAF7F2,
  ), // Arena Claro - fondo principal más neutral
  ColorsName.surfaceDark: const Color(
    0xFFBF9B8F,
  ), // Rosa Arcilla - tarjetas con contraste
  ColorsName.surfaceWhite: const Color(
    0xFFFFFFFF,
  ), // Blanco Puro - superficies elevadas (cards)
  // Marca - Más desaturados para elegancia
  ColorsName.brandPrimary: const Color(
    0xFFE8A598,
  ), // Coral Desaturado - botones principales
  ColorsName.brandAccent: const Color(0xFFC9998B), // Terracota Suave - acentos
  // Textos - Mayor contraste
  ColorsName.textPrimary: const Color(
    0xFF2D3436,
  ), // Casi Negro - texto principal
  ColorsName.textSecondary: const Color(
    0xFF6C757D,
  ), // Gris Medio - textos secundarios
  ColorsName.textOnBrand: const Color(0xFFFFFBF7), // Marfil - texto sobre brand
  // Estados funcionales
  ColorsName.error: const Color(0xFFD64545), // Rojo Terracota para errores
  ColorsName.success: const Color(0xFF7A9B5F), // Verde Salvia para éxito
  ColorsName.warning: const Color(0xFFE6B566), // Ocre Dorado para advertencias
};

Map<ColorsName, Color> _darkColors = {
  // Fondos (versión oscura refinada)
  ColorsName.backgroundLight: const Color(0xFF1A1715), // Chocolate Oscuro
  ColorsName.surfaceDark: const Color(0xFF3D3330), // Café con Leche Oscuro
  ColorsName.surfaceWhite: const Color(0xFF2B2522), // Marrón Carbón
  // Marca (mantener calidez con sutileza)
  ColorsName.brandPrimary: const Color(0xFFE8A598), // Coral Desaturado
  ColorsName.brandAccent: const Color(0xFFC9998B), // Terracota Suave
  // Textos
  ColorsName.textPrimary: const Color(0xFFF5F1ED), // Hueso para texto principal
  ColorsName.textSecondary: const Color(
    0xFFB8AEA5,
  ), // Beige Gris para secundarios
  ColorsName.textOnBrand: const Color(0xFFFFFBF7), // Marfil sobre brand
  // Estados funcionales
  ColorsName.error: const Color(0xFFE87B7B), // Rojo Coral claro
  ColorsName.success: const Color(0xFF96B87D), // Verde Salvia claro
  ColorsName.warning: const Color(0xFFF0C985), // Ocre Suave
};

@Riverpod(keepAlive: true)
class ColorsState extends _$ColorsState {
  @override
  Map<ColorsName, Color> build() {
    return _lightColors;
  }

  void setLightMode() {
    state = _lightColors;
  }

  void setDarkMode() {
    state = _darkColors;
  }

  void toggleTheme() {
    state = (state == _lightColors) ? _darkColors : _lightColors;
  }

  bool get isDarkMode => state == _darkColors;
}
