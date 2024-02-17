part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveItemEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveItemEvent({required this.productDataModel});
}
