part of '../pokedex.dart';

class _PokemonGrid extends StatelessWidget {
  const _PokemonGrid({Key key, this.fetchState}) : super(key: key);

  final FetchState fetchState;

  @override
  Widget build(BuildContext context) {
    final state = fetchState;

    if (state == null || state is LoadingState) {
      return Center(child: CircularProgressIndicator());
    }

    if (state is EmptyState) {
      return Text('No data');
    }

    if (state is ErrorState) {
      return Center(
        child: Text('Error'),
      );
    }

    if (state is SuccessState<List<Pokemon>>) {
      return GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(28),
        itemCount: state.data?.length ?? 0,
        itemBuilder: (context, index) => PokemonCard(
          state.data[index],
          index: index,
          onPress: () => AppNavigator.push(Routes.pokemonInfo, {
            'number': state.data[index].number,
          }),
        ),
      );
    }

    return Center(
      child: Text('Unknown Error'),
    );
  }
}
