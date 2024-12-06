import 'package:bloc/bloc.dart';

import 'package:rxdart/rxdart.dart';
import 'package:zigba/features/employee/Domain/usecase/get_all_employee.dart';
import 'package:zigba/features/employee/presentation/bloc/employee_event.dart';
import 'package:zigba/features/employee/presentation/bloc/employee_state.dart';

import '../../Domain/usecase/add_employee.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final FetchEmployeeUsecase _fetchEmployeeUseCase;
  final RegisterEmployeeUsecase _registerEmployeeUseCase;

  EmployeeBloc(
    this._fetchEmployeeUseCase,
    this._registerEmployeeUseCase,
  ) : super(InitialState()) {
    on<GetEmployeeEvent>((event, emit) async {
      emit(LoadingState());
      final result =
          await _fetchEmployeeUseCase(FetchEmployeeParams(email: event.email));
      result.fold((failure) {
        emit(const ErrorState(message: 'unable to load'));
      }, (data) {
        emit(LoadedAllEmployeeState(employees: data));
      });
    }, transformer: debounce(const Duration(milliseconds: 300)));

    on<CreateEmployeeEvent>((event, emit) async {
      emit(LoadingState());
      final result = await _registerEmployeeUseCase(
          RegisterEmployeeParams(email: event.email, employee: event.employee));
      result.fold((failure) {
        emit(const ErrorState(message: 'unable to load'));
      }, (data) {
        emit(SuccessState());
      });
    });
  }
}

EventTransformer<GetEmployeeEvent> debounce<T>(Duration duration) {
  return (event, mapper) => event.debounceTime(duration).flatMap(mapper);
}
