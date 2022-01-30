part of 'layout_cubit.dart';

abstract class LayoutState extends Equatable {
  const LayoutState();

  @override
  List<Object> get props => [];
}

class LayoutInitial extends LayoutState {}



class LayoutIndexChangedState extends LayoutState {
  int index;
  LayoutIndexChangedState({
    required this.index,
  });
   @override
  List<Object> get props => [index];
}


