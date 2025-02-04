part of 'auth_flow_bloc.dart';

@immutable
sealed class AuthFlowState {}

final class AuthFlowInitial extends AuthFlowState {}
//login
final class AuthFlowLoading extends AuthFlowState {}
final class LogSuccess extends AuthFlowState {
  final Map<String ,dynamic> logResponse;
  LogSuccess(this.logResponse);

}
final class LogFailure extends AuthFlowState {

  final String failureMessage;
  LogFailure(this.failureMessage);

}
final class AuthFlowServerFailure extends AuthFlowState {
  final String error;
  AuthFlowServerFailure(this.error);

}
class CheckNetworkConnection extends AuthFlowState {
  final String errorMessage;

  CheckNetworkConnection(this.errorMessage);

}
//NonExisting member sighUp

final class SignUpNonExistingLoading extends AuthFlowState {}

final class SignUpNonExistingSuccess extends AuthFlowState{

  final Map<String ,dynamic> signUpNonExisting;
  SignUpNonExistingSuccess(this.signUpNonExisting);
}

final class SignUpNonExistingFailure extends AuthFlowState{

  final String failureMessage;
  SignUpNonExistingFailure(this.failureMessage);
}

//Existing member sighUp

final class SignUpExistingLoading extends AuthFlowState {}

final class SignUpExistingSuccess extends AuthFlowState{

  final Map<String ,dynamic> signUpExisting;
  SignUpExistingSuccess(this.signUpExisting);
}

final class SignUpExistingFailure extends AuthFlowState{

  final String failureMessage;
  SignUpExistingFailure(this.failureMessage);
}


//profile view details

final class ProfileViewLoading extends AuthFlowState {}

final class ProfileViewSuccess extends AuthFlowState{

  final Map<String ,dynamic> profileDetails;
  ProfileViewSuccess(this.profileDetails);
}

final class ProfileViewFailure extends AuthFlowState{

  final String failureMessage;
  ProfileViewFailure(this.failureMessage);
}

//profile edit
final class ProfileEditLoading extends AuthFlowState {}

final class ProfileEditSuccess extends AuthFlowState{

  final Map<String ,dynamic> profileEditDetails;
  ProfileEditSuccess(this.profileEditDetails);
}

final class ProfileEditFailure extends AuthFlowState{

  final String failureMessage;
  ProfileEditFailure(this.failureMessage);
}


