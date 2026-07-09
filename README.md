# HouseCanary API Ruby client

## Authentication

Generate an API key/secret in HouseCanary and set as environment variables:

- `ENV['HOUSECANARY_API_KEY']`
- `ENV['HOUSECANARY_API_SECRET']`

## Available methods

```ruby
property = Hcn::Property.new address: "4352 Desert Park Ave", unit: nil, city: "North Las Vegas", zipcode: "89085"

property.subject_address # => {msa: "29820", city: "North Las Vegas", fips: "32003", slug: "4352-Desert-Park-Ave-North-Las-Vegas-NV-89085", unit: "", state: "NV", address: "4352 Desert Park Ave", zipcode: "89085", block_id: "320030036621009", latitude: 36.31164, longitude: -115.20045, address_id: 8412516, address_full: "4352 Desert Park Ave North Las Vegas NV 89085", geo_precision: "rooftop", zipcode_plus4: "2321"}

property.public_records # => {pool: nil, attic: nil, sewer: nil, water: nil, zoning: {code: nil, description: nil}, cooling: nil, heating: ["Forced Air Unit"], parking: {total: 2, garage: nil, description: "Built-in"}, stories: 2, basement: {has: nil, total_area: nil, finished_pct: nil}, bedrooms: 4, lot_size: 4792, bathrooms: {full: nil, total: nil, partial: nil, total_provided: 3.0, total_projected: 3}, buildings: nil, fireplace: true, parcel_id: "12407312060", roof_type: nil, year_built: 2007, living_area: 2778, rooms_total: 9, subdivision: nil, units_total: nil, neighborhood: nil, sewer_public: nil, solar_panels: nil, property_type: "SFR", roof_material: "Tile", pool_community: nil, building_quality: nil, fireplaces_total: 1, legal_description: "DIST:NLV CITY/MUNI/TWP:NORTH LAS VEGAS SEC/TWN/RNG/MER:SEC 07 TWN 19S RNG 61E GRAND TETON VALLEY N W 80 PUD-45 #2 PLAT BOOK 123 PAGE 68 LOT 129 MAP REF:PB B0123 P0068", construction_types: ["Frame"], architectural_style: nil, building_condition_code: "Average", living_area_above_grade: nil, living_area_below_grade: nil, walls_exterior_material: "Stucco", property_type_description: "Single Family Residential"}

property.assessment # => {apn: "124-07-312-060", tax_year: 2026, amount_annual: 2772.91, year_assessed: 2026, value_assessed: 150470, value_assessed_land: 35350, value_assessed_improvement: 115120}
```