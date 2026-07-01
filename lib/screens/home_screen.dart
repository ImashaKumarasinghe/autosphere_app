import 'package:flutter/material.dart';
import '../components/offer_card.dart';
import '../components/provider_card.dart';
import '../components/service_category_card.dart';
import '../models/offer_model.dart';
import '../models/provider_model.dart';
import '../models/service_category_model.dart';
import '../theme/app_colors.dart';
import 'fuel_station_listing_screen.dart';
import 'ev_charging_listing_screen.dart';
import 'parking_listing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<ServiceCategory> categories = [
    ServiceCategory(title: 'Fuel Stations', icon: Icons.local_gas_station),
    ServiceCategory(title: 'EV Charging', icon: Icons.electric_car),
    ServiceCategory(title: 'Parking', icon: Icons.local_parking),
    ServiceCategory(title: 'Vehicle Wash', icon: Icons.local_car_wash),
    ServiceCategory(title: 'Detailing', icon: Icons.cleaning_services),
    ServiceCategory(title: 'Accessories', icon: Icons.car_repair),
  ];

  static final List<ProviderModel> nearbyProviders = [
    ProviderModel(
      name: 'City Fuel Station',
      type: 'Fuel Station',
      distance: '1.2 km',
      rating: 4.6,
      status: 'Open',
    ),
    ProviderModel(
      name: 'EcoCharge Hub',
      type: 'EV Charging',
      distance: '2.5 km',
      rating: 4.8,
      status: 'Open',
    ),
    ProviderModel(
      name: 'Quick Park Center',
      type: 'Parking',
      distance: '3.1 km',
      rating: 4.4,
      status: 'Limited',
    ),
  ];

  static final List<OfferModel> offers = [
    OfferModel(
      title: '20% Off Car Wash',
      description: 'Get discount for full vehicle wash packages.',
    ),
    OfferModel(
      title: 'Parking Offer',
      description: 'Book 3 hours and get 1 hour free.',
    ),
    OfferModel(
      title: 'EV Charging Deal',
      description: 'Special weekend charging price available.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),

              const SizedBox(height: 20),

              _buildSearchBar(),

              const SizedBox(height: 24),

              _buildSectionTitle('Smart Services'),

              const SizedBox(height: 14),

              GridView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return ServiceCategoryCard(
                    title: category.title,
                    icon: category.icon,
                    onTap: () {
  if (category.title == 'Fuel Stations') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FuelStationListingScreen(),
      ),
    );
  } else if (category.title == 'EV Charging') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EvChargingListingScreen(),
      ),
    );
  } else if (category.title == 'Parking') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ParkingListingScreen(),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${category.title} module coming soon'),
      ),
    );
  }
},
                  );
                },
              ),

              const SizedBox(height: 26),

              _buildSectionTitle('Latest Offers'),

              const SizedBox(height: 14),

              SizedBox(
                height: 145,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    final offer = offers[index];

                    return OfferCard(
                      title: offer.title,
                      description: offer.description,
                    );
                  },
                ),
              ),

              const SizedBox(height: 26),

              _buildSectionTitle('Nearby Services'),

              const SizedBox(height: 14),

              ListView.builder(
                itemCount: nearbyProviders.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final provider = nearbyProviders[index];

                  return ProviderCard(
                    name: provider.name,
                    type: provider.type,
                    distance: provider.distance,
                    rating: provider.rating,
                    status: provider.status,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'AutoSphere',
              style: TextStyle(
                color: AppColors.deepNavy,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: AppColors.deepNavy,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search fuel, EV, parking, wash...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: AppColors.cardWhite,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.deepNavy,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}