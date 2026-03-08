# Categories
categories = {}
%w[Clothing Toiletries Electronics Documents Accessories Footwear Food Gear].each do |name|
  categories[name] = Category.find_or_create_by!(name: name)
end

# Tags
tags = {}
[
  "Beach", "City", "Hiking", "Winter", "Summer", "Camping",
  "Business", "Weekend", "Long trip", "Rainy", "Formal"
].each do |name|
  tags[name] = Tag.find_or_create_by!(name: name)
end

# Helper to create items with tags
def seed_item(name, category, tag_names, tags)
  item = Item.find_or_create_by!(name: name, category: category)
  tag_names.each do |tag_name|
    item.item_tags.find_or_create_by!(tag: tags[tag_name])
  end
  item
end

# Clothing
seed_item("T-shirts", categories["Clothing"], ["Summer", "Beach", "City", "Hiking", "Camping", "Weekend"], tags)
seed_item("Jeans", categories["Clothing"], ["City", "Weekend", "Long trip"], tags)
seed_item("Shorts", categories["Clothing"], ["Summer", "Beach", "Hiking", "Camping"], tags)
seed_item("Underwear", categories["Clothing"], ["Beach", "City", "Hiking", "Winter", "Summer", "Camping", "Business", "Weekend", "Long trip"], tags)
seed_item("Socks", categories["Clothing"], ["City", "Hiking", "Winter", "Camping", "Business", "Weekend", "Long trip"], tags)
seed_item("Sweater", categories["Clothing"], ["Winter", "City", "Hiking", "Long trip", "Rainy"], tags)
seed_item("Rain jacket", categories["Clothing"], ["Hiking", "Rainy", "Camping"], tags)
seed_item("Down jacket", categories["Clothing"], ["Winter", "Hiking"], tags)
seed_item("Dress shirt", categories["Clothing"], ["Business", "Formal", "City"], tags)
seed_item("Dress pants", categories["Clothing"], ["Business", "Formal"], tags)
seed_item("Swimsuit", categories["Clothing"], ["Beach", "Summer"], tags)
seed_item("Pajamas", categories["Clothing"], ["Long trip", "Weekend"], tags)
seed_item("Sundress", categories["Clothing"], ["Summer", "Beach", "City"], tags)
seed_item("Leggings", categories["Clothing"], ["Hiking", "Camping", "City", "Weekend"], tags)
seed_item("Thermal base layer", categories["Clothing"], ["Winter", "Hiking", "Camping"], tags)

# Toiletries
seed_item("Toothbrush", categories["Toiletries"], ["Beach", "City", "Hiking", "Winter", "Summer", "Camping", "Business", "Weekend", "Long trip"], tags)
seed_item("Toothpaste", categories["Toiletries"], ["Beach", "City", "Hiking", "Winter", "Summer", "Camping", "Business", "Weekend", "Long trip"], tags)
seed_item("Shampoo", categories["Toiletries"], ["City", "Business", "Long trip", "Weekend"], tags)
seed_item("Sunscreen", categories["Toiletries"], ["Beach", "Summer", "Hiking", "Camping"], tags)
seed_item("Deodorant", categories["Toiletries"], ["Beach", "City", "Hiking", "Summer", "Camping", "Business", "Weekend", "Long trip"], tags)
seed_item("Lip balm", categories["Toiletries"], ["Winter", "Hiking", "Camping"], tags)
seed_item("Bug spray", categories["Toiletries"], ["Hiking", "Camping"], tags)
seed_item("Medications", categories["Toiletries"], ["Beach", "City", "Hiking", "Winter", "Summer", "Camping", "Business", "Weekend", "Long trip"], tags)

# Electronics
seed_item("Phone charger", categories["Electronics"], ["Beach", "City", "Hiking", "Winter", "Summer", "Camping", "Business", "Weekend", "Long trip"], tags)
seed_item("Laptop", categories["Electronics"], ["Business", "City", "Long trip"], tags)
seed_item("Laptop charger", categories["Electronics"], ["Business", "City", "Long trip"], tags)
seed_item("Power bank", categories["Electronics"], ["Hiking", "Camping", "City", "Long trip", "Beach"], tags)
seed_item("Headphones", categories["Electronics"], ["City", "Business", "Long trip"], tags)
seed_item("Camera", categories["Electronics"], ["Beach", "Hiking", "City", "Camping"], tags)
seed_item("E-reader", categories["Electronics"], ["Beach", "Long trip", "Weekend"], tags)

# Documents
seed_item("Passport", categories["Documents"], ["City", "Beach", "Business", "Long trip"], tags)
seed_item("Travel insurance", categories["Documents"], ["City", "Beach", "Hiking", "Business", "Long trip"], tags)
seed_item("Boarding pass", categories["Documents"], ["City", "Beach", "Business", "Long trip"], tags)

# Accessories
seed_item("Sunglasses", categories["Accessories"], ["Beach", "Summer", "City", "Hiking"], tags)
seed_item("Hat", categories["Accessories"], ["Beach", "Summer", "Hiking"], tags)
seed_item("Watch", categories["Accessories"], ["Business", "Formal", "City"], tags)
seed_item("Belt", categories["Accessories"], ["Business", "Formal", "City"], tags)
seed_item("Scarf", categories["Accessories"], ["Winter", "City"], tags)
seed_item("Gloves", categories["Accessories"], ["Winter", "Hiking"], tags)
seed_item("Umbrella", categories["Accessories"], ["Rainy", "City", "Business"], tags)
seed_item("Daypack", categories["Accessories"], ["Hiking", "City", "Beach"], tags)

# Footwear
seed_item("Sneakers", categories["Footwear"], ["City", "Weekend", "Summer"], tags)
seed_item("Hiking boots", categories["Footwear"], ["Hiking", "Camping"], tags)
seed_item("Flip flops", categories["Footwear"], ["Beach", "Summer"], tags)
seed_item("Dress shoes", categories["Footwear"], ["Business", "Formal"], tags)
seed_item("Warm boots", categories["Footwear"], ["Winter"], tags)

# Food
seed_item("Snacks", categories["Food"], ["Hiking", "Camping", "Long trip"], tags)
seed_item("Water bottle", categories["Food"], ["Hiking", "Camping", "City", "Beach", "Summer"], tags)

# Gear
seed_item("Tent", categories["Gear"], ["Camping"], tags)
seed_item("Sleeping bag", categories["Gear"], ["Camping"], tags)
seed_item("Headlamp", categories["Gear"], ["Camping", "Hiking"], tags)
seed_item("First aid kit", categories["Gear"], ["Camping", "Hiking"], tags)
seed_item("Trekking poles", categories["Gear"], ["Hiking"], tags)
seed_item("Travel towel", categories["Gear"], ["Beach", "Camping", "Hiking"], tags)

puts "Seeded #{Category.count} categories, #{Tag.count} tags, #{Item.count} items, #{ItemTag.count} item-tag associations"
