import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String link;
  final IconData icon;

  const MenuItem({required this.title, required this.link, required this.icon});
}

const appMenuItem = [
  MenuItem(title: 'Inicio', link: '/', icon: Icons.home_filled),
  MenuItem(
      title: 'Categorias', link: '/categories', icon: Icons.category_rounded),
  MenuItem(
      title: 'Lugares Turisticos', link: '/touristplaces', icon: Icons.place),
  MenuItem(title: 'Clientes', link: '/clients', icon: Icons.group),
  MenuItem(
      title: 'Reservaciones',
      link: '/reservations',
      icon: Icons.event_available),
  MenuItem(title: 'Excursiones', link: '/excursions', icon: Icons.landscape),
];
