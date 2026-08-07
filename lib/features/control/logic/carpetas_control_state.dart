import 'package:agenda_ganadera/core/database/app_database.dart';

enum CarpetasControlStatus {
  inicial,
  cargando,
  cargado,
  error,
}

class CarpetasControlState {
  final CarpetasControlStatus status;
  final List<CarpetaControlData> carpetas;
  final String? mensajeError;

  const CarpetasControlState({
    this.status = CarpetasControlStatus.inicial,
    this.carpetas = const [],
    this.mensajeError,
  });

  CarpetasControlState copyWith({
    CarpetasControlStatus? status,
    List<CarpetaControlData>? carpetas,
    String? mensajeError,
    bool limpiarError = false,
  }) {
    return CarpetasControlState(
      status: status ?? this.status,
      carpetas: carpetas ?? this.carpetas,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
    );
  }

  bool get estaCargando => status == CarpetasControlStatus.cargando;

  bool get estaVacio => carpetas.isEmpty;
}
