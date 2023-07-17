// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());
}

class SplashState extends Equatable {
  const SplashState({this.isRequiredForeceUpdate});

  final bool? isRequiredForeceUpdate;

  @override
  List<Object?> get props => [isRequiredForeceUpdate];

  SplashState copyWith({
    bool? isRequiredForeceUpdate,
  }) {
    return SplashState(
      isRequiredForeceUpdate:
          isRequiredForeceUpdate ?? this.isRequiredForeceUpdate,
    );
  }
}
