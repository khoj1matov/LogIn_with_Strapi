import 'package:bloc/bloc.dart';
import 'package:loginstrapi/views/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}

Future getDataFromApi() async {}
