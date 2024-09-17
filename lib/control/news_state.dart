part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
// final class  DataReach extends NewsState{}

final class  PostsReach extends NewsState{}