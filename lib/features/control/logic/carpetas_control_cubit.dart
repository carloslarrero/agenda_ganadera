import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agenda_ganadera/core/database/app_database.dart';
import 'package:agenda_ganadera/features/control/data/control_repository.dart';
import 'package:agenda_ganadera/features/control/logic/carpetas_control_state.dart';

class CarpetasControlCubit extends Cubit<CarpetasControlState> {
  final ControlRepository repository;

  StreamSubscription<List<CarpetaControlData>>? _subscription;

  CarpetasControlCubit({
    required this.repository,
  }) : super(const CarpetasControlState());

  void observarCarpetas() {
    emit(
      state.copyWith(
        status: CarpetasControlStatus.cargando,
        limpiarError: true,
      ),
    );

    _subscription?.cancel();

    _subscription = repository.observarCarpetas().listen(
      (carpetas) {
        emit(
          state.copyWith(
            status: CarpetasControlStatus.cargado,
            carpetas: carpetas,
            limpiarError: true,
          ),
        );
      },
      onError: (Object error, StackTrace stackTrace) {
        emit(
          state.copyWith(
            status: CarpetasControlStatus.error,
            mensajeError: 'No se pudieron cargar las carpetas: $error',
          ),
        );
      },
    );
  }

  Future<void> crearCarpeta(String titulo) async {
    final String tituloLimpio = titulo.trim();

    if (tituloLimpio.isEmpty) {
      _emitirError('El título no puede estar vacío.');
      return;
    }

    try {
      await repository.crearCarpeta(
        titulo: tituloLimpio,
      );
    } catch (error) {
      _emitirError(
        'No se pudo guardar la carpeta: $error',
      );
    }
  }

  Future<void> actualizarCarpeta({
    required int id,
    required String titulo,
  }) async {
    final String tituloLimpio = titulo.trim();

    if (tituloLimpio.isEmpty) {
      _emitirError('El título no puede estar vacío.');
      return;
    }

    try {
      await repository.actualizarCarpeta(
        id: id,
        titulo: tituloLimpio,
      );
    } catch (error) {
      _emitirError(
        'No se pudo actualizar la carpeta: $error',
      );
    }
  }

  Future<void> eliminarCarpeta(int id) async {
    try {
      await repository.eliminarCarpeta(id);
    } catch (error) {
      _emitirError(
        'No se pudo eliminar la carpeta: $error',
      );
    }
  }

  void limpiarError() {
    emit(
      state.copyWith(
        status: CarpetasControlStatus.cargado,
        limpiarError: true,
      ),
    );
  }

  void _emitirError(String mensaje) {
    emit(
      state.copyWith(
        status: CarpetasControlStatus.error,
        mensajeError: mensaje,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
