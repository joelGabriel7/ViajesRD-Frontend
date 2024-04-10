import 'package:dio/dio.dart';
import 'package:viajes/config/constants/dio_const.dart';
import 'package:viajes/domain/datasource/agency_datasource.dart';
import 'package:viajes/domain/entity/agency.dart';
import 'package:viajes/infrastructure/mappers/agency_mapper.dart';
import 'package:viajes/infrastructure/models/agency_models.dart';

class AgencyApiDatasource extends AgencyDataSource {
  final Dio dio = createDioInstance();

  @override
  Future<Agency> createAgency(String name, String address, String phone,
      String email, String logo, String rnc) async {
    try {
      final response = await dio.post('/agencies/create', data: {
        'name': name,
        'address': address,
        'phone': phone,
        'email': email,
        'logo': logo,
        'rnc': rnc
      });
      if (response.data != null && response.data is Map<String, dynamic>) {
        final reponses = AgenciReponses.fromJson(response.data);
        final entity = AgencyMapper.agencyToEntity(reponses);
        return entity;
      } else {
        throw Exception('Failed to load user');
      }
    } on DioException catch (e) {
      String errorMessage = "Error desconocido";
      if (e.response != null && e.response!.data != null) {
        final responseData = e.response!.data;
        errorMessage =
            responseData['detail'] ?? "Error al procesar la solicitud";
      }
      throw Exception(errorMessage);
    }
  }

  @override
  Future<Agency> updateAgency(int id, String name, String address, String phone,
      String email, String logo, String rnc) {
    throw UnimplementedError();
  }

  @override
  Future<Agency> getAgency(String id) async {
    final Dio dio = createDioInstance();
    try {
      final response = await dio.get('/agencies/$id');
      if (response.data != null && response.data is Map<String, dynamic>) {
        final reponses = AgenciReponses.fromJson(response.data);
        final entity = AgencyMapper.agencyToEntity(reponses);
        return entity;
      } else {
        throw Exception('Failed to load user');
      }
    } on DioException catch (e) {
      String errorMessage = "Error desconocido";
      if (e.response != null && e.response!.data != null) {
        final responseData = e.response!.data;
        errorMessage =
            responseData['detail'] ?? "Error al procesar la solicitud";
      }
      throw Exception(errorMessage);
    }
  }

  @override
  Future<Agency> getAgencyByRnc(String rnc) async {
    final Dio dio = createDioInstance();
    try {
      final response = await dio.get('/agencies/rnc/$rnc');
      if (response.data != null && response.data is Map<String, dynamic>) {
        final reponses = AgenciReponses.fromJson(response.data);
        final entity = AgencyMapper.agencyToEntity(reponses);
        return entity;
      } else {
        throw Exception('Failed to load user');
      }
    } on DioException catch (e) {
      String errorMessage = "Error desconocido";
      if (e.response != null && e.response!.data != null) {
        final responseData = e.response!.data;
        errorMessage =
            responseData['detail'] ?? "Error al procesar la solicitud";
      }
      throw Exception(errorMessage);
    }
  }
}
