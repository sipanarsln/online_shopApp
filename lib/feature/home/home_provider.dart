import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());
}

class HomeState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
