import 'package:agenda_ganadera/core/database/app_database.dart';

enum PesajeStatus {
  inicial,
  cargando,
  cargado,
  error,
}

class PesajeState {
  final PesajeStatus status;
  final List<ControlesPesajeData> controles;
  final String? mensajeError;

  const PesajeState({
    this.status = PesajeStatus.inicial,
    this.controles = const [],
    this.mensajeError,
  });

  PesajeState copyWith({
    PesajeStatus? status,
    List<ControlesPesajeData>? controles,
    String? mensajeError,
    bool limpiarError = false,
  }) {
    return PesajeState(
      status: status ?? this.status,
      controles: controles ?? this.controles,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
    );
  }

  bool get estaCargando => status == PesajeStatus.cargando;

  bool get tieneError => status == PesajeStatus.error;

  bool get estaVacio => controles.isEmpty;
}
