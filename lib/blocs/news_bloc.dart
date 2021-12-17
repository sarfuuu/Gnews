import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _newsFetcher = PublishSubject<dynamic>();

  Stream<dynamic> get allMovies => _newsFetcher.stream;

  fetchAllNews(dynamic search) async {
    dynamic itemModel = await _repository.fetchAllNews(search);
    _newsFetcher.sink.add(itemModel);
  }

  dispose() {
    _newsFetcher.close();
  }
}

final bloc = MoviesBloc();
