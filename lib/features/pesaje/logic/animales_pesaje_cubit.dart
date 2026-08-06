import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agenda_ganadera/features/pesaje/data/pesaje_repository.dart';
import 'package:agenda_ganadera/features/pesaje/logic/animales_pesaje_state.dart';

class AnimalesPesajeCubit extends Cubit<AnimalesPesajeState> {
  final PesajeRepository repository;
  final int categoriaPesajeId;

  StreamSubscription? _animalesSubscription;

  AnimalesPesajeCubit({
    required this.repository,
    required this.categoriaPesajeId,
  }) : super(const AnimalesPesajeState());

  void observarAnimales() {
    emit(
      state.copyWith(
        status: AnimalesPesajeStatus.cargando,
        limpiarError: true,
      ),
    );

    _animalesSubscription?.cancel();

    _animalesSubscription =
        repository.observarAnimales(categoriaPesajeId).listen(
      (animales) {
        emit(
          state.copyWith(
            status: AnimalesPesajeStatus.cargado,
            animales: animales,
            limpiarError: true,
          ),
        );
      },
      onError: (Object error, StackTrace stackTrace) {
        emit(
          state.copyWith(
            status: AnimalesPesajeStatus.error,
            mensajeError: 'No se pudieron cargar los animales: $error',
          ),
        );
      },
    );
  }

  Future<void> agregarAnimal({
    required String identificativo,
    required double peso,
  }) async {
    final String identificativoLimpio = identificativo.trim();

    if (identificativoLimpio.isEmpty) {
      emit(
        state.copyWith(
          status: AnimalesPesajeStatus.error,
          mensajeError: 'El identificativo no puede estar vacío.',
        ),
      );
      return;
    }

    if (peso <= 0) {
      emit(
        state.copyWith(
          status: AnimalesPesajeStatus.error,
          mensajeError: 'El peso debe ser mayor que cero.',
        ),
      );
      return;
    }

    try {
      await repository.agregarAnimal(
        categoriaPesajeId: categoriaPesajeId,
        identificativo: identificativoLimpio,
        peso: peso,
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AnimalesPesajeStatus.error,
          mensajeError: 'No se pudo guardar el animal: $error',
        ),
      );
    }
  }

  Future<void> actualizarAnimal({
    required int animalId,
    required String identificativo,
    required double peso,
  }) async {
    final String identificativoLimpio = identificativo.trim();

    if (identificativoLimpio.isEmpty) {
      emit(
        state.copyWith(
          status: AnimalesPesajeStatus.error,
          mensajeError: 'El identificativo no puede estar vacío.',
        ),
      );
      return;
    }

    if (peso <= 0) {
      emit(
        state.copyWith(
          status: AnimalesPesajeStatus.error,
          mensajeError: 'El peso debe ser mayor que cero.',
        ),
      );
      return;
    }

    try {
      await repository.actualizarAnimal(
        animalId: animalId,
        identificativo: identificativoLimpio,
        peso: peso,
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AnimalesPesajeStatus.error,
          mensajeError: 'No se pudo actualizar el animal: $error',
        ),
      );
    }
  }

  Future<void> eliminarAnimal(int animalId) async {
    try {
      await repository.eliminarAnimal(animalId);
    } catch (error) {
      emit(
        state.copyWith(
          status: AnimalesPesajeStatus.error,
          mensajeError: 'No se pudo eliminar el animal: $error',
        ),
      );
    }
  }

  void limpiarError() {
    emit(
      state.copyWith(
        status: AnimalesPesajeStatus.cargado,
        limpiarError: true,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _animalesSubscription?.cancel();
    return super.close();
  }
}
