part of 'bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final List<Product> newcomersProducts;
  final List<Product> favorites;

  Loaded({
    required this.newcomersProducts,
    required this.favorites,
  });

  @override
  List<Object> get props => [
        newcomersProducts,
        favorites,
      ];
}

class ErrorToLoad extends HomeState {
  final String message;

  ErrorToLoad({required this.message});

  @override
  List<Object> get props => [message];
}
