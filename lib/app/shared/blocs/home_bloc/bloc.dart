import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneplanet/api/api.dart';

part 'state.dart';

part 'event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository productRepository;

  HomeBloc({required this.productRepository}) : super(Loading()) {
    on<LoadPage>(_loadPage);
  }

  Future<void> _loadPage(LoadPage event, Emitter<HomeState> emit) async {
    try {
      List<Product> newcomersProducts = await productRepository.getNewcomersProducts();
      List<Product> favorites = await productRepository.getFavorites();
      emit(Loaded(
        newcomersProducts: newcomersProducts,
        favorites: favorites,
      ));
    } on ApiException catch (e) {
      emit(ErrorToLoad(message: e.message ?? 'Erro ao carregar dados'));
    }
  }
}
