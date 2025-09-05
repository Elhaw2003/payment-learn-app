import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_index_state.dart';

class ChangeIndexCubit extends Cubit<ChangeIndexState> {
  ChangeIndexCubit() : super(ChangeIndexInitialState());

  int index = 0;

  changeIndex(index){
    this.index = index;
    emit(ChangeIndexSuccessState());
  }

}
