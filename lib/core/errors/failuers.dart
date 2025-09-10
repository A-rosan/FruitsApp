abstract class Failuer {
  final String msg;
  Failuer(this.msg);
}

class ServerFailuer extends Failuer {
  ServerFailuer(super.msg);
}
