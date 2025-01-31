import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum TransactionType {
  depot,
  paiement,
  echec,
}

class Transaction {
  final Image icon;
  final String title;
  final int amount;
  final TransactionType type;

  Transaction(
      {required this.title,
      required this.amount,
      required this.type,
      required this.icon});

  static List<Transaction> today = [
    Transaction(
        title: "De +2250701038463",
        amount: 400,
        type: TransactionType.depot,
        icon: Assets.pngs.wave.image()),
    Transaction(
        title: "Protection de vos fonds",
        amount: 400,
        type: TransactionType.paiement,
        icon: Assets.pngs.djamoAppLogo.image())
  ];
  static List<Transaction> yesterday = [
    Transaction(
        title: "Spotify",
        amount: 2090,
        type: TransactionType.paiement,
        icon: Assets.pngs.spotify.image()),
    Transaction(
        title: "De 2250703849302",
        amount: 50000,
        type: TransactionType.depot,
        icon: Assets.pngs.orange.image()),
    Transaction(
        title: "De 2250506039343",
        amount: 2090,
        type: TransactionType.depot,
        icon: Assets.pngs.mtn.image()),
  ];
  static List<Transaction> date_26 = [
    Transaction(
        title: "Spotify",
        amount: 2090,
        type: TransactionType.echec,
        icon: Assets.pngs.spotify.image()),
  ];
  static List<Transaction> date_27 = [
    Transaction(
        title: "Spotify",
        amount: 2090,
        type: TransactionType.echec,
        icon: Assets.pngs.spotify.image()),
    Transaction(
        title: "De +2250103849302",
        amount: 5000,
        type: TransactionType.depot,
        icon: Assets.pngs.moov.image()),
    Transaction(
        title: "Spotify",
        amount: 2090,
        type: TransactionType.echec,
        icon: Assets.pngs.spotify.image()),
  ];
}
