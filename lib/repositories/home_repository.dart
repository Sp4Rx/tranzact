import 'package:tranzact/core/api_client.dart';
import 'package:tranzact/models/home_model.dart';

class HomeRepository {
  static final HomeRepository _instance = HomeRepository.internal();
  final ApiClient _apiClient = ApiClient();

  HomeRepository.internal();

  factory HomeRepository() => _instance;

  Future<List<HomeModel>> getHomeData() async {
    List<HomeModel> data = [];
    final response = await _apiClient
        .get('https://628b17d4667aea3a3e270c25.mockapi.io/home');

    if (response != null) {
      response.forEach((item) => data.add(HomeModel.fromJson(item)));
    }
    return data;
  }
}
