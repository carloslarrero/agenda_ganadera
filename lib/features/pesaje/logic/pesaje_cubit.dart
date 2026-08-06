import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agenda_ganadera/features/pesaje/data/pesaje_repository.dart';
import 'package:agenda_ganadera/features/pesaje/logic/pesaje_state.dart';

class PesajeCubit extends Cubit<PesajeState> {
  final PesajeRepository repository;

  StreamSubscription? _controlesSubscription;

  PesajeCubit({
    required this.repository,
  }) : super(const PesajeState());

  void observarControles() {
    emit(
      state.copyWith(
        status: PesajeStatus.cargando,
        limpiarError: true,
      ),
    );

    _controlesSubscription?.cancel();

    _controlesSubscription = repository.observarControlesPesaje().listen(
      (controles) {
        emit(
          state.copyWith(
            status: PesajeStatus.cargado,
            controles: controles,
            limpiarError: true,
          ),
        );
      },
      onError: (Object error, StackTrace stackTrace) {
        emit(
          state.copyWith(
            status: PesajeStatus.error,
            mensajeError:
                'No se pudieron cargar los controles de pesaje: $error',
          ),
        );
      },
    );
  }

  Future<void> crearControl({
    required String titulo,
    required DateTime fecha,
  }) async {
    final String tituloLimpio = titulo.trim();

    if (tituloLimpio.isEmpty) {
      emit(
        state.copyWith(
          status: PesajeStatus.error,
          mensajeError: 'El título no puede estar vacío.',
        ),
      );
      return;
    }

    try {
      await repository.crearControlPesaje(
        titulo: tituloLimpio,
        fecha: fecha,
      );

      /*
       * No agregamos manualmente el control al estado.
       *
       * El método observarControles() está escuchando Drift.
       * Cuando Drift detecta la inserción, emite automáticamente
       * la lista actualizada.
       */
    } catch (error) {
      emit(
        state.copyWith(
          status: PesajeStatus.error,
          mensajeError: 'No se pudo guardar el control de pesaje: $error',
        ),
      );
    }
  }

  Future<void> actualizarControl({
    required int id,
    required String titulo,
    required DateTime fecha,
  }) async {
    final String tituloLimpio = titulo.trim();

    if (tituloLimpio.isEmpty) {
      emit(
        state.copyWith(
          status: PesajeStatus.error,
          mensajeError: 'El título no puede estar vacío.',
        ),
      );
      return;
    }

    try {
      await repository.actualizarControlPesaje(
        id: id,
        titulo: tituloLimpio,
        fecha: fecha,
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: PesajeStatus.error,
          mensajeError: 'No se pudo actualizar el control de pesaje: $error',
        ),
      );
    }
  }

  Future<void> eliminarControl(int id) async {
    try {
      await repository.eliminarControlPesaje(id);
    } catch (error) {
      emit(
        state.copyWith(
          status: PesajeStatus.error,
          mensajeError: 'No se pudo eliminar el control de pesaje: $error',
        ),
      );
    }
  }

  void limpiarError() {
    emit(
      state.copyWith(
        status: PesajeStatus.cargado,
        limpiarError: true,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _controlesSubscription?.cancel();
    return super.close();
  }
}
