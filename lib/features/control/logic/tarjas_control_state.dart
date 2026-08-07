import 'package:agenda_ganadera/core/database/app_database.dart';

enum TarjasControlStatus {
  inicial,
  cargando,
  cargado,
  error,
}

class TarjasControlState {
  final TarjasControlStatus status;
  final List<TarjaControlData> tarjas;
  final String? mensajeError;

  const TarjasControlState({
    this.status = TarjasControlStatus.inicial,
    this.tarjas = const [],
    this.mensajeError,
  });

  TarjasControlState copyWith({
    TarjasControlStatus? status,
    List<TarjaControlData>? tarjas,
    String? mensajeError,
    bool limpiarError = false,
  }) {
    return TarjasControlState(
      status: status ?? this.status,
      tarjas: tarjas ?? this.tarjas,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
    );
  }

  bool get estaCargando => status == TarjasControlStatus.cargando;

  int get total {
    return tarjas.fold<int>(
      0,
      (suma, tarja) => suma + tarja.cantidad,
    );
  }
}
