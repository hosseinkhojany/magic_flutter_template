import 'package:get/get.dart';
import 'package:rapexa_academy/structure/data/models/request/login_rq.dart';
import 'package:rapexa_academy/structure/domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  LoginUseCase useCase;

  LoginController(this.useCase);

  void login() {
    useCase.login(
      LoginRq(),
      loading: () {

      },
      error: (error) {

      },
      success: (rp) {

      },
    );
  }
}
