import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agenda_ganadera/core/database/app_database.dart';
import 'package:agenda_ganadera/features/control/data/control_repository.dart';
import 'package:agenda_ganadera/features/control/logic/actividades_control_state.dart';

class ActividadesControlCubit extends Cubit<ActividadesControlState> {
  final ControlRepository repository;
  final int carpetaControlId;

  StreamSubscription<List<ActividadControlData>>? _subscription;

  ActividadesControlCubit({
    required this.repository,
    required this.carpetaControlId,
  }) : super(const ActividadesControlState());

  void observarActividades() {
    emit(
      state.copyWith(
        status: ActividadesControlStatus.cargando,
        limpiarError: true,
      ),
    );

    _subscription?.cancel();

    _subscription = repository.observarActividades(carpetaControlId).listen(
      (actividades) {
        emit(
          state.copyWith(
            status: ActividadesControlStatus.cargado,
            actividades: actividades,
            limpiarError: true,
          ),
        );
      },
      onError: (Object error, StackTrace stackTrace) {
        emit(
          state.copyWith(
            status: ActividadesControlStatus.error,
            mensajeError: 'No se pudieron cargar las actividades: $error',
          ),
        );
      },
    );
  }

  Future<void> crearActividad({
    required String titulo,
    required DateTime fecha,
  }) async {
    final String tituloLimpio = titulo.trim();

    if (tituloLimpio.isEmpty) {
      _emitirError('El título no puede estar vacío.');
      return;
    }

    try {
      await repository.crearActividad(
        carpetaControlId: carpetaControlId,
        titulo: tituloLimpio,
        fecha: fecha,
      );
    } catch (error) {
      _emitirError(
        'No se pudo guardar la actividad: $error',
      );
    }
  }

  Future<void> eliminarActividad(int id) async {
    try {
      await repository.eliminarActividad(id);
    } catch (error) {
      _emitirError(
        'No se pudo eliminar la actividad: $error',
      );
    }
  }

  void limpiarError() {
    emit(
      state.copyWith(
        status: ActividadesControlStatus.cargado,
        limpiarError: true,
      ),
    );
  }

  void _emitirError(String mensaje) {
    emit(
      state.copyWith(
        status: ActividadesControlStatus.error,
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
