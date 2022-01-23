// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traveler_datasours.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _TravelersDataSours implements TravelersDataSours {
  _TravelersDataSours(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.instantwebtools.net/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TravelersPage> getPages(page, size) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'size': size};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TravelersPage>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/passenger',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TravelersPage.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
