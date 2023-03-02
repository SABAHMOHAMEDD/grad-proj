abstract class VerificationStates {}

class VerificationIntialState extends VerificationStates {}

class VerificationLoadinState extends VerificationStates {}

class VerificationSuccessState extends VerificationStates {}

class VerificationErrorState extends VerificationStates {
  final String error;

  VerificationErrorState(this.error);
}


