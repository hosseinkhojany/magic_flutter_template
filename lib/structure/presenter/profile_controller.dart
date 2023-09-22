import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rapexa_academy/structure/data/models/request/get_profile_rq.dart';
import 'package:rapexa_academy/structure/data/models/response/get_profile_rp.dart';
import 'package:rapexa_academy/structure/domain/usecases/profile_usecase.dart';

import '../../infrastructure/widgets/app_snackbar.dart';

class ProfileController extends GetxController {
  final ProfileUseCase _useCase;

  ProfileController(this._useCase);

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  GetProfileRp? rp;
  getProfile(){
    _useCase.getProfile(
      ProfileRq(),
      loading: () {
        AppSnackBar.showLoading();
        update();
      },
      error: (error) {
        AppSnackBar.showError(error.message);
        update();
      },
      success: (rp) async {
        this.rp = rp;
        AppSnackBar.dismissLoading();
        update();
      },
    );
  }

}