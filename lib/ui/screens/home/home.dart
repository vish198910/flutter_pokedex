import 'package:flutter/material.dart';

import '../../../configs/colors.dart';
import '../../../configs/images.dart';
import '../../../data/categories.dart';
import '../../../di/injection.dart';
import '../../../routes.dart';
import '../../widgets/poke_category_card.dart';
import '../../widgets/poke_container.dart';
import '../../widgets/poke_news.dart';
import '../../widgets/search_bar.dart';
import 'home_bloc.dart';

part 'widgets/header_app_bar.dart';
part 'widgets/pokemon_news.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = getIt<HomeBloc>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final screenSize = MediaQuery.of(context).size;
    final cardHeight = screenSize.height * _HeaderAppBar.heightFraction;

    _bloc.appBar.setCardHeight(cardHeight);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _bloc.dispose();

    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    _bloc.appBar.handleScrollEvent(_scrollController.offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          StreamBuilder<AppBarStateType>(
            stream: _bloc.appBar.stream,
            initialData: AppBarStateType(height: 0.0, showTitle: false),
            builder: (_, snapshot) {
              return _HeaderAppBar(
                height: snapshot.data.height,
                showTitle: snapshot.data.showTitle,
              );
            },
          ),
        ],
        body: _PokemonNews(),
      ),
    );
  }
}
