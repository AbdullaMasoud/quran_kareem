import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'misbaha_state.dart';

class MisbahaCubit extends Cubit<MisbahaState> {
  MisbahaCubit() : super(MisbahaInitial());

  static MisbahaCubit get(context) => BlocProvider.of(context);

  Offset distance = const Offset(28, 28);
  double blur = 30;
  bool isPressed = false;

  double misbahaSize = 200.r;

  int misbahaButtonCounter = 0;
  int misbahaCircelCounter = 0;

  misbahaButtonClicked() {
    misbahaButtonCounter++;
    if (misbahaButtonCounter == 33) {
      misbahaCircelCounter++;
      misbahaButtonCounter = 0;
    }
  }

  sibahaButtonPressed() {
    isPressed = false;
    misbahaSize = 200.r;
    distance = const Offset(28, 28);
    blur = 30;
    misbahaButtonClicked();
    emit(SibhaButtonOpenState());
  }

  sibahaButtonClosed() {
    isPressed = true;
    misbahaSize = 150.r;
    distance = const Offset(10, 10);
    blur = 5.0;
    emit(SibhaButtonCloseState());
  }

  reset() {
    misbahaButtonCounter = 0;
    misbahaCircelCounter = 0;
    emit(SibhaRested());
  }
}
