import 'package:bloc/bloc.dart';

import 'package:rxdart/rxdart.dart';

import '../../domain/usecase/fetch_company_useCase.dart';
import '../../domain/usecase/register_company_useCase.dart';
import 'company_event.dart';
import 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final FetchCompanyUsecase _fetchCompanyUseCase;
  final RegisterCompanyUsecase _registerCompanyUseCase;

  CompanyBloc(
    this._fetchCompanyUseCase,
    this._registerCompanyUseCase,
  ) : super(InitialState()) {
    on<GetCompanyEvent>((event, emit) async {
      emit(LoadingState());
      final result =
          await _fetchCompanyUseCase(FetchCompanyParams(email: event.email));
      result.fold((failure) {
        emit(const ErrorState(message: 'unable to load'));
      }, (data) {
        emit(LoadedCompanyState(company: data));
      });
    }, transformer: debounce(const Duration(milliseconds: 300)));

    on<CreateCompanyEvent>((event, emit) async {
      emit(LoadingState());
      final result = await _registerCompanyUseCase(
          RegisterCompanyParams(email: event.email, company: event.company));
      result.fold((failure) {
        emit(const ErrorState(message: 'unable to load'));
      }, (data) {
        emit(SuccessState());
      });
    });
  }
}

EventTransformer<GetCompanyEvent> debounce<T>(Duration duration) {
  return (event, mapper) => event.debounceTime(duration).flatMap(mapper);
}
