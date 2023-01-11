import 'package:ac/models/help_point.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const _locations = [
  LatLng(-11.9898422, -77.017445),
  LatLng(-12.0053186, -77.0023974),
  LatLng(-12.0039465, -77.0026495),
  LatLng(-12.0031315, -77.0077385),
  LatLng(-12.0034797, -77.0142482),
  LatLng(-12.015581, -77.009377),
  LatLng(-11.9844405, -77.0100214),
];

final helpPointsList = [
  HelpPoint(
    pointName: 'Charitable',
    asset:
        'https://images.unsplash.com/photo-1672661164593-409ac24bb706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    pointAddress: 'Av.El ejercito 244',
    schedule: '9:00 - 5:00 PM',
    location: _locations[0],
  ),
  HelpPoint(
    pointName: 'Ministerio Social',
    asset:
        'https://images.unsplash.com/photo-1672661164593-409ac24bb706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    pointAddress: 'Av.Los Jardines 244',
    schedule: '9:00 - 6:00 PM',
    location: _locations[1],
  ),
  HelpPoint(
    pointName: 'Casa Ayuda',
    asset:
        'https://images.unsplash.com/photo-1672661164593-409ac24bb706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    pointAddress: 'Av.Los Huertos 1345',
    schedule: '8:00 - 4:00 PM',
    location: _locations[2],
  ),
  HelpPoint(
    pointName: 'Alegrando Vidas',
    asset:
        'https://images.unsplash.com/photo-1672661164593-409ac24bb706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    pointAddress: 'Av.Proceres 479',
    schedule: '9:00 - 5:00 PM',
    location: _locations[3],
  ),
  HelpPoint(
    pointName: 'Caritas',
    asset:
        'https://images.unsplash.com/photo-1672661164593-409ac24bb706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    pointAddress: 'Av.La Esperanza 3476',
    schedule: '9:00 - 5:00 PM',
    location: _locations[4],
  ),
  HelpPoint(
    pointName: 'Solidarios',
    asset:
        'https://images.unsplash.com/photo-1672661164593-409ac24bb706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    pointAddress: 'Av.Naciones Unidas 444',
    schedule: '8:00 - 5:00 PM',
    location: _locations[5],
  ),
  HelpPoint(
    pointName: 'Hogar Perú',
    asset:
        'https://images.unsplash.com/photo-1672661164593-409ac24bb706?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    pointAddress: 'Av.El angel  1614',
    schedule: '9:00 - 6:00 PM',
    location: _locations[6],
  ),
];
