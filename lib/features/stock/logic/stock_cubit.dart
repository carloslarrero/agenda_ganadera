import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agenda_ganadera/features/stock/data/stock_repository.dart';
import 'package:agenda_ganadera/features/stock/logic/stock_state.dart';

class StockCubit extends Cubit<StockState> {
  final StockRepository repository;

  StreamSubscription<List<dynamic>>? _stockSubscription;

  StockCubit({
    required this.repository,
  }) : super(const StockState());

  void observarStock() {
    emit(
      state.copyWith(
        status: StockStatus.cargando,
        limpiarError: true,
      ),
    );

    _stockSubscription?.cancel();

    _stockSubscription = repository.observarStock().listen(
      (animales) {
        emit(
          state.copyWith(
            status: StockStatus.cargado,
            animales: animales,
            limpiarError: true,
          ),
        );
      },
      onError: (Object error, StackTrace stackTrace) {
        emit(
          state.copyWith(
            status: StockStatus.error,
            mensajeError: 'No se pudo cargar el stock de animales: $error',
          ),
        );
      },
    );
  }

  Future<void> agregarAnimal({
    required String tipo,
    required int cantidad,
  }) async {
    final String tipoLimpio = tipo.trim();

    if (tipoLimpio.isEmpty) {
      _emitirError(
        'El tipo de animal no puede estar vacío.',
      );
      return;
    }

    if (cantidad < 0) {
      _emitirError(
        'La cantidad no puede ser negativa.',
      );
      return;
    }

    try {
      await repository.agregarAnimal(
        tipo: tipoLimpio,
        cantidad: cantidad,
      );
    } catch (error) {
      _emitirError(
        'No se pudo agregar el animal: $error',
      );
    }
  }

  Future<void> actualizarAnimal({
    required int id,
    required String tipo,
    required int cantidad,
  }) async {
    final String tipoLimpio = tipo.trim();

    if (tipoLimpio.isEmpty) {
      _emitirError(
        'El tipo de animal no puede estar vacío.',
      );
      return;
    }

    if (cantidad < 0) {
      _emitirError(
        'La cantidad no puede ser negativa.',
      );
      return;
    }

    try {
      await repository.actualizarAnimal(
        id: id,
        tipo: tipoLimpio,
        cantidad: cantidad,
      );
    } catch (error) {
      _emitirError(
        'No se pudo actualizar el animal: $error',
      );
    }
  }

  Future<void> eliminarAnimal(int id) async {
    try {
      await repository.eliminarAnimal(id);
    } catch (error) {
      _emitirError(
        'No se pudo eliminar el animal: $error',
      );
    }
  }

  void limpiarError() {
    emit(
      state.copyWith(
        status: StockStatus.cargado,
        limpiarError: true,
      ),
    );
  }

  void _emitirError(String mensaje) {
    emit(
      state.copyWith(
        status: StockStatus.error,
        mensajeError: mensaje,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _stockSubscription?.cancel();
    return super.close();
  }
}
