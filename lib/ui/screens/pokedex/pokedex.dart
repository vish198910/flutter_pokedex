import 'package:flutter/material.dart';

import '../../../core/fetch_state.dart';
import '../../../di/injection.dart';
import '../../../domain/entities/pokemon.dart';
import '../../../routes.dart';
import '../../widgets/fab.dart';
import '../../widgets/poke_container.dart';
import '../../widgets/pokemon_card.dart';
import 'modals/generation_modal.dart';
import 'modals/search_modal.dart';
import 'pokedex_bloc.dart';

part 'widgets/fab_menu.dart';
part 'widgets/fab_overlay_background.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen();

  @override
  State<StatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen>
    with SingleTickerProviderStateMixin {
  PokedexBloc _bloc;
  Animation<double> _fabAnimation;
  AnimationController _fabAnimationController;

  @override
  void didChangeDependencies() {
    if (_bloc == null) {
      _bloc = getIt<PokedexBloc>();
      _bloc.pokemonState.stream.listen((event) {
        // print(event);
      });
      _bloc.getPokemons();
      _bloc.fabMenu.stream.listen((isShowFab) {
        if (isShowFab) {
          _fabAnimationController.forward();
        } else {
          _fabAnimationController.reverse();
        }
      });
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _fabAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _fabAnimationController,
    ));

    super.initState();
  }

  void _showSearchModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SearchBottomModal(),
    );
  }

  void _showGenerationModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GenerationModal(),
    );
  }

  Widget _buildBody(BuildContext context, AsyncSnapshot<FetchState> snapshot) {
    final state = snapshot.data;

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
        padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
        itemCount: state.data?.length ?? 0,
        itemBuilder: (context, index) => PokemonCard(
          state.data[index],
          index: index,
          onPress: () {
            AppNavigator.push(Routes.pokemonInfo);
            // Navigator.of(context)
            //     .pushNamed("/pokemon-info", arguments: {'pokemon': state.data[index]});
          },
        ),
      );
    }

    return Center(
      child: Text('Unknown Error'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PokeContainer(
            appBar: true,
            children: <Widget>[
              SizedBox(height: 34),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0),
                child: Text(
                  'Pokedex',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: StreamBuilder(
                  stream: _bloc.pokemonState.stream,
                  builder: _buildBody,
                ),
              ),
            ],
          ),
          _FabOverlayBackground(
            animation: _fabAnimation,
            onPressOut: _bloc.fabMenu.toggle,
          ),
        ],
      ),
      floatingActionButton: _FabMenu(
        animation: _fabAnimation,
        toggle: _bloc.fabMenu.toggle,
        onAllGenPress: _showGenerationModal,
        onSearchPress: _showSearchModal,
      ),
    );
  }
}
