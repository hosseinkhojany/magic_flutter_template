import 'package:rapexa_academy/infrastructure/constants/enums.dart';
import 'package:rapexa_academy/structure/data/datasources/local/shared_store.dart';
import 'package:rapexa_academy/structure/data/models/response/logins_and_forgot_and_register_rp.dart';

Flavor currentAppFlavor = Flavor.MAIN;
String token_wc = "Basic Y2tfMmRkNTQxYTg2NDU3YjdhMjYxMjJhYjM0Yzk5YzRmODQ3OTlmOGMxZDpjc19kNGY1ZDNjZGExMzRmZjczM2VmM2U0MGRjZDUyOGYzMTk0NTJjOTBi";
LoginRp? user = SharedStore.getUser();