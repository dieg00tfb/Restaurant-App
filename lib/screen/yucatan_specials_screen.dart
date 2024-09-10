import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class YucatanSpecialsScreen extends StatelessWidget {
  YucatanSpecialsScreen({super.key});

  final List<MenuItem> yucatanspecials = [
    MenuItem(name: 'Quesadilla Fajita', description: 'A flour tortilla grilled and stuffed with tender strips of marinated chicken or beef skirt steak with sauteed onions, mushrooms, tomato, bell pepper and garnished with lettuce and sour cream.', price: 13.99),
    MenuItem(name: 'Nachos Fajitas', description: 'Served with French fries and garnished with lettuce and tomato.', price: 7.99),
    MenuItem(name: 'Nachos Fajita Yucatan', description: 'Chicken, steak, shrimp, onions, tomatoes, bell peppers and mushrooms topped with cheese sauce, lettuce and sour cream.', price: 15.99),
    MenuItem(name: 'Enchiladas Roja', description: 'Three rolled corn tortillas with chicken or beef. Topped with red enchilada sauce. Served with Mexican rice and beans.', price: 11.99),
    MenuItem(name: 'Wet Burritos', description: 'Three rolled corn tortillas with chicken or beef. Topped with red enchilada sauce. Served with Mexican rice and beans.', price: 12.99),
    MenuItem(name: 'Super Burrito', description: 'Big flour tortilla rolled with broiled steak, beans cheese and Mexican rice. Topped with cheese, lettuce guacamole, tomato and sour cream.', price: 12.99),
    MenuItem(name: 'Chimichanga Fajita', description: 'We stuff a flour tortilla with tender strips of marinated chicken or beef skirt steak with sauteed onions, bell peppers, mushrooms, tomatoes and garnished with lettuce and sour cream. Served with Mexican rice and beans.', price: 13.99),
    MenuItem(name: 'Milanesas', description: 'Marinated chicken breast or steak battered with eggs and cubed with bread, then deep fried to a golden brown. Served with lettuce, tomato, sour cream, Mexican rice and beans.', price: 16.99),
    MenuItem(name: 'Enchiladas Tampiquena', description: 'Five rolled corn tortillas with beef or chicken or chicken and beef, topped with our green sauce, lettuce, tomato and sour cream.', price: 12.99),
    MenuItem(name: 'Fajita Single order', description: '', price: 15.99),
    MenuItem(name: 'Fajita Double order', description: '', price: 27.99),
    MenuItem(name: 'Combination Fajitas', description: 'We use our special recipe to cook tender strips of marinated chicken breast or beef skirt steak served with sauteed onions, bell peppers mushrooms, tomatoes and garnished with lettuce, sour cream, corn or flour tortilla with refried beans and Mexican rice.', price: 28.99),
    MenuItem(name: 'Yucatan Fajita', description: 'Marinated tender strips of beef, chicken and shrimp served with sauteed onions bell peppers, tomatoes, mushrooms refried beans, Mexican rice salad and 3 flour tortillas on the side.', price: 17.99),
    MenuItem(name: 'Fajita Hawaiana', description: 'Shrimp, ham, and pineapple with onions, tomatoes, bell peppers and mushrooms. Served with rice, beans and tortillas.', price: 16.99),
    MenuItem(name: 'Fajita Texanas', description: 'Strips of chicken, steak, shrimp, pork, chorizo and vegtables served with rice and beans, lettuce and sour cream.', price: 19.99),
    MenuItem(name: 'Special Dinner', description: 'Chalupa, taco, chile relleno, tamale, enchilada, Mexian rice and beans..', price: 14.99),
    MenuItem(name: 'Carne Asada', description: 'Steak served with rice and beans, lettuce, tomatoes and onions.', price: 15.99),
    MenuItem(name: 'Ribeye Steak', description: 'Ribeye Steak topped with onions and mushrooms. Severed with rice, beans, and tortillas.', price: 13.99),
    MenuItem(name: 'Yucatan Special', description: 'One chicken burrito and one chicken enchilada topped with lettuce and sour cream and an avacado slice.', price: 10.99),
    MenuItem(name: 'Cheese Steak', description: 'Steak topped with cheese sauce. Served with rice, beans, tortillas.', price: 16.99),
    MenuItem(name: 'Taco Salad Fajitas', description: 'A crisp flour tortilla with melted cheese sacue, topped with your choice of chicken, steak, sauteed with onions, bell peppers, tomatoes and mushrooms. Covered with lettuce, cheese and sour cream.', price: 12.99),
    MenuItem(name: 'Chile Colorado', description: 'Beef chunks with red chile sauce, served with rice, beans and flour tortillas.', price: 15.99),
    MenuItem(name: 'Enchiladas Suizas', description: 'Four shredded chicken enchiladas topped with tomatillo sauce and shredded cheese.', price: 11.99),
    MenuItem(name: 'Enchiladas Mexicanas', description: 'Four chicken or beef enchiladas topped with tomatillo sauce and shredded cheese.', price: 12.99),
    MenuItem(name: 'Enchiladas Mexicanas', description: 'Four chicken or beef enchiladas topped with tomatillo sauce and shredded cheese.', price: 12.99),
    MenuItem(name: 'Parrillada', description: 'Grilled beef with chopped bacon, chorizo, ham, bell peppers, onions and topped with shredded cheese. Served with rice, beans and tortillas.', price: 19.99),
    MenuItem(name: 'Steak Mexican', description: 'Beef steak topped with cooked onions, tomatoes, mushrooms, Mexian rice, beans, and bell peppeers. Served with tortillas.', price: 16.99),
    MenuItem(name: 'Chimichanga', description: 'We stuff a flour tortilla with your choice of of chunks of beef or chicken, then deep fired to a golden brown. Topped with cheese sauce, lettuce and sour cream. Served with rice and beans.', price: 16.99),
    MenuItem(name: 'Enchiladas Rancheras', description: 'Two cheese enchiladas topped with pork, cooked with tomatoes, onions, mushrooms, and bell peppers and enchilada saucce. Served with salad.', price: 13.99),
    MenuItem(name: 'Enchiladas Supremas', description: 'Four rolled corn tortillas, one beef, one chicken, one bean, topped with enchilada sauce, cheese, lettuce, tomatoe adnd sour cream.', price: 12.99),
    MenuItem(name: 'Choripollo', description: 'Strips of grilled chicken breast with cchorizo adn shredded hceese. Served with rice and beans.', price: 13.99),
    MenuItem(name: 'Taquitos Mexicanos', description: 'Four rolled corn tortillas stuffed with beef or chicken, topped with cheese sauce and served with lettuce and sour cream.', price: 9.99),
    MenuItem(name: 'Burritos Vaqueros', description: 'Two flour tortillas rolled with broiled steak. Topped with cheese sauce, lettuce and sour cream.', price: 11.99),
    MenuItem(name: 'Yucatan Combo', description: 'Two chille rellenos, one burrito, one taco, and one enchilada topped with cheese sauce, lettuce, sour cream, and tomato.', price: 14.99),
    MenuItem(name: 'Pollo Yucatan', description: 'A chicken breast topped with sauteed onions and cheese dip. Garnished with Mexican rice, lettuce adn sour cream.', price: 14.99),
    MenuItem(name: 'Fajitas Camaron', description: 'We use our special recipe to cook shrimp, served withsauteed onions, bell peppers, mushrooms and tomatoes adn garnished with lettuce, sour cream, tortillas with refried beans and Mexican rice.', price: 17.99),
    MenuItem(name: 'Burrito Mexicano', description: 'A flour tortilla stuffed with pork, cooked with tomatoes, onions, bell peppers, mushrooms, and topped with cheese. Served with avocado slices and sour cream.', price: 11.99),
    MenuItem(name: 'Yucatan Quesadilla Fajita', description: 'A flour tortilla grilled and stuffed with tender strips of steak, chicken, and shrimp, with sauteed onions, bell peppers, mushrooms and tomato. Garnished lettuce and sour cream.', price: 16.99),
    MenuItem(name: 'Enchiladas Morelianas', description: 'Two seafood, two chicken and two beef rolled tortillas with cheese sauce, lettuce, sour cream and tomato.', price: 16.99),
    MenuItem(name: 'Platillo Campestre', description: 'A steak and shrimp, with rice, beans, lettuce, sour cream, and tortilla.', price: 16.99),
    MenuItem(name: 'Burritos Frontera', description: 'Two flour tortillas rolled with chorizo, grilled onions and chicken topped with red sauce, sour cream, and lettuce, served with Mexican rice and beans.', price: 15.99),
    MenuItem(name: 'Pollo Verde', description: 'Grilled chicken breast served with green sauce on top, Mexican rice and beans and an avocado slice.', price: 13.99),
    MenuItem(name: 'Taco Salad', description: 'Chicken or beef - A crisp flour tortilla with melted cheese sauce topped with tomato, cheese and sour cream.', price: 11.99),
    MenuItem(name: 'Fajita Plate', description: 'Choice of chicken, steak, or shrimp fajita with vegtables served with rice and topped with cheese sauce', price: 13.99),
    MenuItem(name: 'Molcajete', description: 'Chicken, steak, shrimp, pork, and vegtables with shredded cheese. Served with rice, beans, and tortillas.', price: 19.99),
    MenuItem(name: 'Chile Relleno fajita', description: 'A poblano pepper stuffed with potato and cheese and topped with chicken or steak with grilled onions. Served with rice, beans and salad.', price: 15.99),
    MenuItem(name: 'Chile Verde', description: 'Pork tips with tomatillo sauce. Served with rice, beans, and tortillas.', price: 13.99),
    MenuItem(name: 'Steak con Camarones', description: 'Steak with shrimp, chorizo and onions. Topped with shredded cheese and served with rice, beans and tortillas.', price: 17.99),
    MenuItem(name: 'Carnitas', description: 'Pork tips, rice, beans, and salad served with tortillas.', price: 15.99),
    // Add more appetizers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('YUCATAN SPECIALS'),
      ),
      body: ListView.builder(
        itemCount: yucatanspecials.length,
        itemBuilder: (context, index) {
          final menuItem = yucatanspecials[index];
          return MenuItemWidget(
            menuItem: yucatanspecials[index],
            onAddToOrder: () {
              final cartProvider = Provider.of<CartProvider>(context, listen: false);
              cartProvider.addItem(
                CartItem(
                  name: menuItem.name,
                  description: menuItem.description,
                  price: menuItem.price,
                ),
              );// Handle adding item to order
            },
          );
        },
      ),
    );
  }
}
