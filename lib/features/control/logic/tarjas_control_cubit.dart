import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agenda_ganadera/core/database/app_database.dart';
import 'package:agenda_ganadera/features/control/data/control_repository.dart';
import 'package:agenda_ganadera/features/control/logic/tarjas_control_state.dart';

class TarjasControlCubit extends Cubit<TarjasControlState> {
  final ControlRepository repository;
  final int actividadControlId;

  StreamSubscription<List<TarjaControlData>>? _subscription;

  TarjasControlCubit({
    required this.repository,
    required this.actividadControlId,
  }) : super(const TarjasControlState());

  void observarTarjas() {
    emit(
      state.copyWith(
        status: TarjasControlStatus.cargando,
        limpiarError: true,
      ),
    );

    _subscription?.cancel();

    _subscription = repository.observarTarjas(actividadControlId).listen(
      (tarjas) {
        emit(
          state.copyWith(
            status: TarjasControlStatus.cargado,
            tarjas: tarjas,
            limpiarError: true,
          ),
        );
      },
      onError: (Object error, StackTrace stackTrace) {
        emit(
          state.copyWith(
            status: TarjasControlStatus.error,
            mensajeError: 'No se pudo cargar la tarja: $error',
          ),
        );
      },
    );
  }

  Future<void> crearTarja({
    required String tipo,
  }) async {
    final String tipoLimpio = tipo.trim();

    if (tipoLimpio.isEmpty) {
      _emitirError(
        'El tipo de animal no puede estar vacío.',
      );
      return;
    }

    try {
      await repository.crearTarja(
        actividadControlId: actividadControlId,
        tipo: tipoLimpio,
        cantidad: 0,
      );
    } catch (error) {
      _emitirError(
        'No se pudo crear la tarja: $error',
      );
    }
  }

  Future<void> actualizarTarja({
    required int id,
    required String tipo,
    required int cantidad,
  }) async {
    if (cantidad < 0) {
      cantidad = 0;
    }

    try {
      await repository.actualizarTarja(
        id: id,
        tipo: tipo.trim(),
        cantidad: cantidad,
      );
    } catch (error) {
      _emitirError(
        'No se pudo actualizar la tarja: $error',
      );
    }
  }

  Future<void> sumar(TarjaControlData tarja) async {
    await actualizarTarja(
      id: tarja.id,
      tipo: tarja.tipo,
      cantidad: tarja.cantidad + 1,
    );
  }

  Future<void> restar(TarjaControlData tarja) async {
    final int nuevaCantidad = tarja.cantidad > 0 ? tarja.cantidad - 1 : 0;

    await actualizarTarja(
      id: tarja.id,
      tipo: tarja.tipo,
      cantidad: nuevaCantidad,
    );
  }

  Future<void> eliminarTarja(int id) async {
    try {
      await repository.eliminarTarja(id);
    } catch (error) {
      _emitirError(
        'No se pudo eliminar la tarja: $error',
      );
    }
  }

  void _emitirError(String mensaje) {
    emit(
      state.copyWith(
        status: TarjasControlStatus.error,
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
