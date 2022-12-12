import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/color_model/color_model.dart';
import '../../../service/color_name_generator_service.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  final textEditingController = TextEditingController();

  final _service = ColorNameGeneratorService();

  Future<void> getColorName() async {
    if (textEditingController.text.isNotEmpty) {
      final request = await _service.generatedColorWithHEX(
        textEditingController.text,
      );
      request.fold(
        (left) => print(left),
        (right) => emit(state.copyWith(colorModel: right)),
      );
    }
  }
}
