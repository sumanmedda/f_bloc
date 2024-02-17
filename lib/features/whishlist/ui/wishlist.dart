import 'package:bloc_app/features/whishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_app/features/whishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Wishlist Items'),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                return successState.wishlistItems.isEmpty
                    ? const Center(
                        child: Text('Add Some Items'),
                      )
                    : ListView.builder(
                        itemCount: successState.wishlistItems.length,
                        itemBuilder: (context, index) {
                          return WishlistTileWidget(
                            wishlistBloc: wishlistBloc,
                            productDataModel: successState.wishlistItems[index],
                          );
                        });
              default:
                return const SizedBox(
                  child: Text('data'),
                );
            }
          },
        ));
  }
}
