part of 'change_index_cubit.dart';

@immutable
sealed class ChangeIndexState {}

final class ChangeIndexInitialState extends ChangeIndexState {}
final class ChangeIndexSuccessState extends ChangeIndexState {}
