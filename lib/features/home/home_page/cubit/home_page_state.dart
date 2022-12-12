// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  const HomePageState({this.colorModel});

  final ColorModel? colorModel;

  @override
  List<Object> get props => [colorModel ?? Color];

  HomePageState copyWith({
    ColorModel? colorModel,
  }) {
    return HomePageState(colorModel: colorModel);
  }
}

class HomePageInitial extends HomePageState {}
