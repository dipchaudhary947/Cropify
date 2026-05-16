import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:latlong2/latlong.dart';

class FarmerMapSection extends StatefulWidget {
  const FarmerMapSection({super.key});

  @override
  State<FarmerMapSection> createState() => _FarmerMapSectionState();
}

class _FarmerMapSectionState extends State<FarmerMapSection> {
  final MapController _mapController = MapController();

  /// User Location
  final LatLng _userLocation = const LatLng(13.7563, 100.5018);

  /// Route Coordinates
  List<LatLng> _polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    _generateRouteCoordinates();
  }

  /// Generate Polyline Route
  void _generateRouteCoordinates() {
    PolylinePoints polylinePoints = PolylinePoints();

    const String encodedPolylineString =
        "ia_jF_f|uNd@w@vAsB`AoB`@uA`@wBn@eDh@uD";

    List<PointLatLng> decodedPoints = polylinePoints.decodePolyline(
      encodedPolylineString,
    );

    if (decodedPoints.isNotEmpty) {
      setState(() {
        _polylineCoordinates = decodedPoints
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        color: const Color(0xffE8F3E5),
        borderRadius: BorderRadius.circular(32),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _userLocation,
                initialZoom: 14,
              ),

              children: [
                /// OpenStreetMap Tiles
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.cropify.app',
                ),

                /// Route Line
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _polylineCoordinates,
                      strokeWidth: 5,
                      color: const Color(0xFF4CAF50),
                    ),
                  ],
                ),

                /// Markers
                MarkerLayer(
                  markers: [
                    /// Green Organic Farm
                    Marker(
                      point: const LatLng(13.7620, 100.4930),
                      width: 34,
                      height: 34,
                      child: _buildMarker(
                        color: Colors.green,
                        icon: Icons.agriculture,
                      ),
                    ),

                    /// Yellow Popular Farm
                    Marker(
                      point: const LatLng(13.7585, 100.4980),
                      width: 34,
                      height: 34,
                      child: _buildMarker(
                        color: Colors.yellow.shade700,
                        icon: Icons.storefront,
                      ),
                    ),

                    /// Brown Traditional Farm
                    Marker(
                      point: const LatLng(13.7540, 100.5070),
                      width: 34,
                      height: 34,
                      child: _buildMarker(
                        color: Colors.brown,
                        icon: Icons.grass,
                      ),
                    ),

                    /// User Location Marker
                    Marker(
                      point: _userLocation,
                      width: 24,
                      height: 24,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 6),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            /// Top Info Card
            Positioned(
              top: 14,
              left: 14,
              right: 14,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.95),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 8),
                  ],
                ),
                child: Row(
                  children: [
                    _legendDot(Colors.green),
                    const SizedBox(width: 6),
                    const Text(
                      "Organic",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(width: 14),

                    _legendDot(Colors.yellow.shade700),
                    const SizedBox(width: 6),
                    const Text(
                      "Popular",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(width: 14),

                    _legendDot(Colors.brown),
                    const SizedBox(width: 6),
                    const Text(
                      "Traditional",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Navigation Button
            Positioned(
              bottom: 18,
              right: 18,
              child: GestureDetector(
                onTap: () {
                  _mapController.move(_userLocation, 14);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),
                  child: const Icon(
                    Icons.navigation_outlined,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Marker Widget
  Widget _buildMarker({required Color color, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  /// Legend Dot
  Widget _legendDot(Color color) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
