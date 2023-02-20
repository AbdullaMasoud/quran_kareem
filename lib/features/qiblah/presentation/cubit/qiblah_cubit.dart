import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'qiblah_state.dart';

class QiblahCubit extends Cubit<QiblahState> {
  QiblahCubit() : super(QiblahInitial());
}
