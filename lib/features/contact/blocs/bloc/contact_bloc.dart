import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dashboard/injectable_config.dart';
import 'package:injectable/injectable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

ContactBloc get contactBloc => getIt<ContactBloc>();

@LazySingleton()
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<Map> contacts = [];

  ContactBloc() : super(ContactInitial()) {
    on<UpdateContactUIEvent>((event, emit) {
      emit(ContactInitial());
      emit(UpdateContactUISate());
    });
  }
}
