import 'package:agenda_ganadera/core/database/app_database.dart';

enum CategoriaPesajeStatus {
  inicial,
  cargando,
  cargado,
  error,
}

class CategoriaPesajeState {
  final CategoriaPesajeStatus status;
  final List<CategoriasPesajeData> categorias;
  final String? mensajeError;

  const CategoriaPesajeState({
    this.status = CategoriaPesajeStatus.inicial,
    this.categorias = const [],
    this.mensajeError,
  });

  CategoriaPesajeState copyWith({
    CategoriaPesajeStatus? status,
    List<CategoriasPesajeData>? categorias,
    String? mensajeError,
    bool limpiarError = false,
  }) {
    return CategoriaPesajeState(
      status: status ?? this.status,
      categorias: categorias ?? this.categorias,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
    );
  }

  bool get estaCargando => status == CategoriaPesajeStatus.cargando;

  bool get tieneError => status == CategoriaPesajeStatus.error;

  bool get estaVacio => categorias.isEmpty;
}
