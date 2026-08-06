import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agenda_ganadera/features/pesaje/data/pesaje_repository.dart';
import 'package:agenda_ganadera/features/pesaje/logic/categoria_pesaje_state.dart';

class CategoriaPesajeCubit extends Cubit<CategoriaPesajeState> {
  final PesajeRepository repository;
  final int controlPesajeId;

  StreamSubscription? _categoriasSubscription;

  CategoriaPesajeCubit({
    required this.repository,
    required this.controlPesajeId,
  }) : super(const CategoriaPesajeState());

  void observarCategorias() {
    emit(
      state.copyWith(
        status: CategoriaPesajeStatus.cargando,
        limpiarError: true,
      ),
    );

    _categoriasSubscription?.cancel();

    _categoriasSubscription =
        repository.observarCategorias(controlPesajeId).listen(
      (categorias) {
        emit(
          state.copyWith(
            status: CategoriaPesajeStatus.cargado,
            categorias: categorias,
            limpiarError: true,
          ),
        );
      },
      onError: (Object error, StackTrace stackTrace) {
        emit(
          state.copyWith(
            status: CategoriaPesajeStatus.error,
            mensajeError: 'No se pudieron cargar las categorías: $error',
          ),
        );
      },
    );
  }

  Future<void> crearCategoria(String nombre) async {
    final String nombreLimpio = nombre.trim();

    if (nombreLimpio.isEmpty) {
      emit(
        state.copyWith(
          status: CategoriaPesajeStatus.error,
          mensajeError: 'El nombre de la categoría no puede estar vacío.',
        ),
      );
      return;
    }

    final bool yaExiste = state.categorias.any(
      (categoria) =>
          categoria.nombre.toLowerCase() == nombreLimpio.toLowerCase(),
    );

    if (yaExiste) {
      emit(
        state.copyWith(
          status: CategoriaPesajeStatus.error,
          mensajeError: 'Ya existe una categoría con ese nombre.',
        ),
      );
      return;
    }

    try {
      await repository.crearCategoria(
        controlPesajeId: controlPesajeId,
        nombre: nombreLimpio,
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: CategoriaPesajeStatus.error,
          mensajeError: 'No se pudo guardar la categoría: $error',
        ),
      );
    }
  }

  Future<void> eliminarCategoria(int categoriaId) async {
    try {
      await repository.eliminarCategoria(categoriaId);
    } catch (error) {
      emit(
        state.copyWith(
          status: CategoriaPesajeStatus.error,
          mensajeError: 'No se pudo eliminar la categoría: $error',
        ),
      );
    }
  }

  Future<void> actualizarNombre({
    required int categoriaId,
    required String nombre,
  }) async {
    final String nombreLimpio = nombre.trim();

    if (nombreLimpio.isEmpty) {
      emit(
        state.copyWith(
          status: CategoriaPesajeStatus.error,
          mensajeError: 'El nombre de la categoría no puede estar vacío.',
        ),
      );
      return;
    }

    try {
      await repository.actualizarNombreCategoria(
        categoriaId: categoriaId,
        nombre: nombreLimpio,
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: CategoriaPesajeStatus.error,
          mensajeError: 'No se pudo actualizar la categoría: $error',
        ),
      );
    }
  }

  Future<void> actualizarDestare({
    required int categoriaId,
    required double porcentaje,
  }) async {
    try {
      await repository.actualizarDestare(
        categoriaId: categoriaId,
        porcentaje: porcentaje,
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: CategoriaPesajeStatus.error,
          mensajeError: 'No se pudo actualizar el destare: $error',
        ),
      );
    }
  }

  void limpiarError() {
    emit(
      state.copyWith(
        status: CategoriaPesajeStatus.cargado,
        limpiarError: true,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _categoriasSubscription?.cancel();
    return super.close();
  }
}
