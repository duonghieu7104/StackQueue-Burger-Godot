# Simple 2D Pixel Game - Godot 4.1.1

This project is a simple 2D pixel game created in **Godot 4.1.1**. The game focuses on managing a food counter where players serve burgers to characters. The core gameplay revolves around queue and stack data structures to simulate a restaurant environment.

## Game Overview

In this game, characters will move around a map and head to the food counter when they get hungry. Players must prepare and serve burgers based on each character's order. Here's how the game works:

- **Characters** arrive at the food counter when hungry and are placed in a **queue**.
- Players will select the burger ingredients in the correct order according to the character's menu request.
- Ingredients chosen by the player are placed in a **stack**, allowing the player to undo mistakes.
- If the player delivers the correct burger, they earn money; delivering the wrong burger will result in a penalty.
- Money can be used to buy more ingredients to keep the food counter running.

## Key Features

- **Queue System**: Hungry characters wait in line at the food counter.
- **Stack System**: Players build burgers by selecting ingredients in the correct order, with the ability to undo choices.
- **Resource Management**: Earn money by serving correct orders and use it to purchase additional ingredients.
- **Pixel Art**: Simple 2D pixel visuals to create a charming, retro feel.

## Controls

- **Mouse**: Interact with the food counter, select ingredients, and serve burgers.
- **Undo (Stack)**: Players can undo their last selection if they pick the wrong ingredient.

## Installation and Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/duonghieu7104/StackQueue-Burger-Godot.git
   ```

2. **Open the project in Godot 4.1.1**: 
   - Download and install [Godot 4.1.1](https://godotengine.org/download).
   - Open the Godot editor, navigate to the cloned project folder, and open the project file (`project.godot`).

3. **Run the Game**: 
   - Press the **F5** key or click the **play** button in Godot to start the game.

## Game Objective

The main goal of the game is to manage the food counter efficiently by serving the correct burger orders to characters and earning money to keep the restaurant running.

## Development Notes

This game was developed as a practice project to apply data structures such as **stack** and **queue** in a gaming context.

## Future Features

- More complex orders with multiple types of food.
- New characters with unique preferences.
- Upgrades for the food counter.
  
## License

This project is licensed under the MIT License.

## References

- [Godot Engine Documentation](https://docs.godotengine.org/)
- [Stack and Queue in Game Development](https://www.geeksforgeeks.org/applications-of-stack-and-queue-in-games/)

Feel free to contribute to the project by submitting issues or making pull requests. Enjoy managing your pixelated food counter!
