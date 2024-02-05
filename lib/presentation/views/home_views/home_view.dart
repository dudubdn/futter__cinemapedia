import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/screens/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
          titlePadding: EdgeInsets.all(0),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [
          MoviesSlideshow(movies: slideShowMovies),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subTitle: 'Lunes 20',
            loadNextpage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: upcomingMovies,
            title: 'Próximamente',
            subTitle: 'Este mes',
            loadNextpage: () =>
                ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: popularMovies,
            title: 'Populares',
            // subTitle: '',
            loadNextpage: () =>
                ref.read(popularMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: topRatedMovies,
            title: 'Mejor calificadas',
            subTitle: 'Desde siempre',
            loadNextpage: () =>
                ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
          ),
          const SizedBox(
            height: 20,
          )
        ]);
      }, childCount: 1))
    ]);
  }
}
