abstract class Failures {
  String messege;

  Failures(this.messege);

  @override
  String toString() {
    return messege;
  }
}

class ServerFailure extends Failures {
  ServerFailure(super.messege);
}

class CachedFailures extends Failures {
  CachedFailures(super.messege);
}
