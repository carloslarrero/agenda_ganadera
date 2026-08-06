import 'package:agenda_ganadera/core/database/app_database.dart';

enum StockStatus {
  inicial,
  cargando,
  cargado,
  error,
}

class StockState {
  final StockStatus status;
  final List<StockAnimalData> animales;
  final String? mensajeError;

  const StockState({
    this.status = StockStatus.inicial,
    this.animales = const [],
    this.mensajeError,
  });

  StockState copyWith({
    StockStatus? status,
    List<StockAnimalData>? animales,
    String? mensajeError,
    bool limpiarError = false,
  }) {
    return StockState(
      status: status ?? this.status,
      animales: animales ?? this.animales,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
    );
  }

  bool get estaCargando => status == StockStatus.cargando;

  bool get tieneError => status == StockStatus.error;

  bool get estaVacio => animales.isEmpty;

  int get total {
    return animales.fold<int>(
      0,
      (suma, animal) => suma + animal.cantidad,
    );
  }
}
