import 'package:agenda_ganadera/core/database/app_database.dart';

enum ActividadesControlStatus {
  inicial,
  cargando,
  cargado,
  error,
}

class ActividadesControlState {
  final ActividadesControlStatus status;
  final List<ActividadControlData> actividades;
  final String? mensajeError;

  const ActividadesControlState({
    this.status = ActividadesControlStatus.inicial,
    this.actividades = const [],
    this.mensajeError,
  });

  ActividadesControlState copyWith({
    ActividadesControlStatus? status,
    List<ActividadControlData>? actividades,
    String? mensajeError,
    bool limpiarError = false,
  }) {
    return ActividadesControlState(
      status: status ?? this.status,
      actividades: actividades ?? this.actividades,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
    );
  }

  bool get estaCargando => status == ActividadesControlStatus.cargando;

  bool get estaVacio => actividades.isEmpty;
}
