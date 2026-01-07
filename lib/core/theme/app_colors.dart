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

// ========== PALETA ACTIVA: CÁLIDA NOSTÁLGICA ==========
// Evoca los tonos de fotos impresas y álbumes vintage
// Map<ColorsName, Color> _lightColors = {
//   // Fondos
//   ColorsName.backgroundLight: const Color(
//     0xFFFFF8E7,
//   ), // Crema - fondo principal
//   ColorsName.surfaceDark: const Color(
//     0xFFD4816F,
//   ), // Terracota - tarjetas con contraste
//   ColorsName.surfaceWhite: const Color(
//     0xFFFFDAB9,
//   ), // Melocotón - superficies elevadas
//   // Marca
//   ColorsName.brandPrimary: const Color(
//     0xFFFF9A8B,
//   ), // Coral Suave - botones principales
//   ColorsName.brandAccent: const Color(0xFFD4816F), // Terracota - acentos
//   // Textos
//   ColorsName.textPrimary: const Color(
//     0xFF36454F,
//   ), // Gris Carbón - texto principal
//   ColorsName.textSecondary: const Color(
//     0xFF8B7E74,
//   ), // Gris Cálido - textos secundarios
//   ColorsName.textOnBrand: const Color(
//     0xFFFFF8E7,
//   ), // Crema claro - texto sobre brand
//   // Estados funcionales
//   ColorsName.error: const Color(0xFFCC5500), // Naranja quemado para errores
//   ColorsName.success: const Color(0xFF6B8E23), // Verde oliva para éxito
//   ColorsName.warning: const Color(
//     0xFFE4A853,
//   ), // Amarillo mostaza para advertencias
// };

// Map<ColorsName, Color> _darkColors = {
//   // Fondos (versión oscura de paleta cálida)
//   ColorsName.backgroundLight: const Color(0xFF2C2420), // Marrón muy oscuro
//   ColorsName.surfaceDark: const Color(0xFF8B7E74), // Gris cálido
//   ColorsName.surfaceWhite: const Color(0xFF4A3F37), // Marrón medio
//   // Marca (mantener calidez)
//   ColorsName.brandPrimary: const Color(0xFFFF9A8B), // Coral Suave
//   ColorsName.brandAccent: const Color(0xFFD4816F), // Terracota
//   // Textos
//   ColorsName.textPrimary: const Color(0xFFFFF8E7), // Crema para texto principal
//   ColorsName.textSecondary: const Color(0xFFD2B48C), // Beige para secundarios
//   ColorsName.textOnBrand: const Color(0xFFFFF8E7), // Crema sobre brand
//   // Estados funcionales
//   ColorsName.error: const Color(0xFFE67350), // Naranja más claro
//   ColorsName.success: const Color(0xFF8CB369), // Verde oliva claro
//   ColorsName.warning: const Color(0xFFF0C571), // Amarillo mostaza claro
// };

// ========== PALETAS ALTERNATIVAS (COMENTADAS) ==========
// Descomenta una de estas paletas y comenta la activa para cambiar el tema

// ---------- PALETA: TONOS TIERRA FAMILIAR ----------
// Ambiente natural y acogedor
Map<ColorsName, Color> _lightColors = {
  ColorsName.backgroundLight: const Color(0xFFD2B48C), // Beige
  ColorsName.surfaceDark: const Color(0xFF8B7355), // Marrón Suave
  ColorsName.surfaceWhite: const Color(0xFFFAF9F6), // Blanco roto
  ColorsName.brandPrimary: const Color(0xFFE4A853), // Amarillo Mostaza
  ColorsName.brandAccent: const Color(0xFFCC5500), // Naranja Quemado
  ColorsName.textPrimary: const Color(0xFF3A2F2B), // Marrón oscuro
  ColorsName.textSecondary: const Color(0xFF8B7355), // Marrón Suave
  ColorsName.textOnBrand: const Color(0xFFFAF9F6), // Blanco roto
  ColorsName.error: const Color(0xFFCC5500), // Naranja Quemado
  ColorsName.success: const Color(0xFF6B8E23), // Verde Oliva
  ColorsName.warning: const Color(0xFFE4A853), // Amarillo Mostaza
};
Map<ColorsName, Color> _darkColors = {
  ColorsName.backgroundLight: const Color(0xFF2B2318),
  ColorsName.surfaceDark: const Color(0xFF8B7355),
  ColorsName.surfaceWhite: const Color(0xFF463A2F),
  ColorsName.brandPrimary: const Color(0xFFE4A853),
  ColorsName.brandAccent: const Color(0xFFCC5500),
  ColorsName.textPrimary: const Color(0xFFFAF9F6),
  ColorsName.textSecondary: const Color(0xFFD2B48C),
  ColorsName.textOnBrand: const Color(0xFF2B2318),
  ColorsName.error: const Color(0xFFE67350),
  ColorsName.success: const Color(0xFF8CB369),
  ColorsName.warning: const Color(0xFFF0C571),
};

// ---------- PALETA: PASTEL SERENA ----------
// Look moderno y minimalista
// Map<ColorsName, Color> _lightColors = {
//   ColorsName.backgroundLight: const Color(0xFFC8E6F5), // Azul Cielo Suave
//   ColorsName.surfaceDark: const Color(0xFFC0C0C0), // Gris Suave
//   ColorsName.surfaceWhite: const Color(0xFFFFFBFE), // Blanco casi puro
//   ColorsName.brandPrimary: const Color(0xFFF4C2C2), // Rosa Empolvado
//   ColorsName.brandAccent: const Color(0xFFE6E6FA), // Lavanda Claro
//   ColorsName.textPrimary: const Color(0xFF4A4A4A), // Gris oscuro
//   ColorsName.textSecondary: const Color(0xFFC0C0C0), // Gris Suave
//   ColorsName.textOnBrand: const Color(0xFF4A4A4A), // Gris oscuro sobre pastel
//   ColorsName.error: const Color(0xFFE57373), // Rojo pastel
//   ColorsName.success: const Color(0xFFB2E8DD), // Verde Menta
//   ColorsName.warning: const Color(0xFFFFD180), // Naranja pastel
// };
// Map<ColorsName, Color> _darkColors = {
//   ColorsName.backgroundLight: const Color(0xFF1A2832),
//   ColorsName.surfaceDark: const Color(0xFF4A4A4A),
//   ColorsName.surfaceWhite: const Color(0xFF2E3842),
//   ColorsName.brandPrimary: const Color(0xFFF4C2C2),
//   ColorsName.brandAccent: const Color(0xFFE6E6FA),
//   ColorsName.textPrimary: const Color(0xFFFFFBFE),
//   ColorsName.textSecondary: const Color(0xFFC0C0C0),
//   ColorsName.textOnBrand: const Color(0xFF4A4A4A),
//   ColorsName.error: const Color(0xFFE57373),
//   ColorsName.success: const Color(0xFFB2E8DD),
//   ColorsName.warning: const Color(0xFFFFD180),
// };

// ---------- PALETA: NEUTRA ELEGANTE ----------
// Sofisticada y atemporal
// Map<ColorsName, Color> _lightColors = {
//   ColorsName.backgroundLight: const Color(0xFFFAF9F6), // Blanco Roto
//   ColorsName.surfaceDark: const Color(0xFF36454F), // Gris Carbón
//   ColorsName.surfaceWhite: const Color(0xFFE8DCC4), // Beige Claro
//   ColorsName.brandPrimary: const Color(0xFFA8A39D), // Gris Medio
//   ColorsName.brandAccent: const Color(0xFFC4B5A0), // Marrón Arena
//   ColorsName.textPrimary: const Color(0xFF36454F), // Gris Carbón
//   ColorsName.textSecondary: const Color(0xFFA8A39D), // Gris Medio
//   ColorsName.textOnBrand: const Color(0xFFFAF9F6), // Blanco Roto
//   ColorsName.error: const Color(0xFF8B4949), // Rojo apagado
//   ColorsName.success: const Color(0xFF6B8E6B), // Verde apagado
//   ColorsName.warning: const Color(0xFFD4A373), // Naranja apagado
// };
// Map<ColorsName, Color> _darkColors = {
//   ColorsName.backgroundLight: const Color(0xFF1C1E1F),
//   ColorsName.surfaceDark: const Color(0xFF36454F),
//   ColorsName.surfaceWhite: const Color(0xFF2A2B2C),
//   ColorsName.brandPrimary: const Color(0xFFA8A39D),
//   ColorsName.brandAccent: const Color(0xFFC4B5A0),
//   ColorsName.textPrimary: const Color(0xFFFAF9F6),
//   ColorsName.textSecondary: const Color(0xFFA8A39D),
//   ColorsName.textOnBrand: const Color(0xFF1C1E1F),
//   ColorsName.error: const Color(0xFFB57070),
//   ColorsName.success: const Color(0xFF8CB389),
//   ColorsName.warning: const Color(0xFFEDC299),
// };

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
