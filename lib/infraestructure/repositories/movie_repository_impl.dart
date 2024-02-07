import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/respositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override

  /// The function `getNowPlaying` returns a Future that retrieves a list of movies currently playing,
  /// with an optional page parameter.
  ///
  /// Args:
  ///   page (int): The "page" parameter is an optional parameter that specifies the page number of the
  /// results to retrieve. By default, it is set to 1. Defaults to 1
  ///
  /// Returns:
  ///   a Future object that resolves to a List of Movie objects.
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMoviebyId(String id) {
    return datasource.getMoviebyId(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return datasource.searchMovies(query);
  }
}
