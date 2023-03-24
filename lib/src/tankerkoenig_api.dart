import 'package:latlong2/latlong.dart';
import 'package:tankerkoenig_api/src/enum/correction_type.dart';
import 'package:tankerkoenig_api/src/model/response_by_id.dart';
import 'package:tankerkoenig_api/src/model/response_by_postalcode.dart';
import 'package:tankerkoenig_api/src/model/response_by_radius.dart';
import 'package:tankerkoenig_api/src/station/by_ids.dart';
import 'package:tankerkoenig_api/src/station/by_postalcode.dart';
import 'package:tankerkoenig_api/src/station/by_radius.dart';
import 'package:tankerkoenig_api/src/station/complaint.dart';

/// Dart implementation for the Tankerkönig API
class TankerkoenigApi {
  final String apikey;

  /// Acces the german patrol station api Tankerkönig
  ///
  /// The Apikey is required to authenticate against the tankerkienig api
  /// you can get an [apikey] via https://creativecommons.tankerkoenig.de/
  const TankerkoenigApi(
    this.apikey,
  );

  final String host = "https://creativecommons.tankerkoenig.de/api/v4/";

  Future<TankerkoenigStationByRadiusResponse> getStationsByRadius(
    LatLng location,
    int radius,
  ) =>
      ByRadius(host, apikey).get(
        location,
        radius,
      );

  Future<TankerkoenigStationByPostalCodeResponse> getStationsByPostalCode(
    int postalCode,
  ) =>
      ByPostalCode(host, apikey).get(
        postalCode,
      );

  Future<TankerkoenigStationByIdsCodeResponse> getStationsByIds(
    String ids,
    LatLng location,
  ) =>
      ByIds(host, apikey).get(
        ids,
        location,
      );

  Future<int> wrongOpenStatus(
    String id,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongStatusOpen,
        "",
      );
  Future<int> wrongClosedStatus(
    String id,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongStatusClosed,
        "",
      );

  Future<int> wrongLocation(
    String id,
    LatLng location,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPetrolStationLocation,
        "${location.latitude},${location.longitude}",
      );

  Future<int> wrongPriceE5(
    String id,
    double price,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPriceE5,
        price.toString(),
      );

  Future<int> wrongPriceE10(
    String id,
    double price,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPriceE10,
        price.toString(),
      );

  Future<int> wrongPriceDiesel(
    String id,
    double price,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPriceDiesel,
        price.toString(),
      );

  Future<int> wrongBrand(
    String id,
    String brand,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPetrolStationBrand,
        brand,
      );

  Future<int> wrongHouseNumber(
    String id,
    String houseNumber,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPetrolStationHouseNumber,
        houseNumber,
      );

  Future<int> wrongPlace(
    String id,
    String place,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPetrolStationPlace,
        place,
      );

  Future<int> wrongName(
    String id,
    String name,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPetrolStationName,
        name,
      );

  Future<int> wrongPostalCode(
    String id,
    String postalCode,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPetrolStationPostcode,
        postalCode,
      );

  Future<int> wrongStreet(
    String id,
    String street,
  ) =>
      Complaint(host, apikey).post(
        id,
        CorrectionType.wrongPetrolStationStreet,
        street,
      );
}
