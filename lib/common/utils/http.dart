
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutternews/common/values/values.dart';

/**
 * 单例模式， 维护一个http工具类实例，方便复用
 */
class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  Dio dio;
  CancelToken cancelToken = new CancelToken();
  
  HttpUtil._internal(){
    // BaseOptions Options RequestOption 都可以配置参数 
    BaseOptions options = new BaseOptions(
      // 请求地址前缀
      baseUrl: SERVER_API_URL,
      // 链接服务器超时时间
      connectTimeout: GLOBAL_CONN_TIME_OUT,
      // 响应超时时间
      receiveTimeout: GLOBAL_RECE_TIME_OUT,
      // http 头部
      headers: {},
      // 请求体类型
      contentType: 'application/json; charset=utf-8',
      // 响应类型
      responseType: ResponseType.json,

    );
    dio = new Dio(options);
    // Cookie 管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors
    .add(InterceptorsWrapper(onRequest: (RequestOptions options){
      print("请求之前");
      return options;
    }, onResponse: (Response response) {
      print("响应之前");
      return response;
    }, onError: (DioError e) {
      print("错误之前");
      return e;
    }));

  }
}