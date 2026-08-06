import 'package:agenda_ganadera/core/database/app_database.dart';

enum AnimalesPesajeStatus {
  inicial,
  cargando,
  cargado,
  error,
}

class AnimalesPesajeState {
  final AnimalesPesajeStatus status;
  final List<AnimalesPesajeData> animales;
  final String? mensajeError;

  const AnimalesPesajeState({
    this.status = AnimalesPesajeStatus.inicial,
    this.animales = const [],
    this.mensajeError,
  });

  AnimalesPesajeState copyWith({
    AnimalesPesajeStatus? status,
    List<AnimalesPesajeData>? animales,
    String? mensajeError,
    bool limpiarError = false,
  }) {
    return AnimalesPesajeState(
      status: status ?? this.status,
      animales: animales ?? this.animales,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
    );
  }

  bool get estaCargando => status == AnimalesPesajeStatus.cargando;

  bool get tieneError => status == AnimalesPesajeStatus.error;

  bool get estaVacio => animales.isEmpty;

  double get totalPeso {
    return animales.fold<double>(
      0,
      (suma, animal) => suma + animal.peso,
    );
  }

  double get promedioPeso {
    if (animales.isEmpty) {
      return 0;
    }

    return totalPeso / animales.length;
  }
}
