# Pokédex Petit

## Objective

This project aims to create a Pokédex application that can run on Android, iOS, desktop, and web platforms. 
The Pokédex will provide functionalities to list all available Pokémon, view captured Pokémon, and see detailed information about each Pokémon.

## General Description

The application will include the following sections:

1. **Pokédex**: List of all available Pokémon.
2. **Captured**: List of Pokémon captured by the trainer.
3. **Pokémon Detail**: Detailed view of a selected Pokémon.

The data will be fetched from the public Pokémon API (PokéApi). The user interface is designed to be intuitive and user-friendly, 
with customizable colors based on the type of Pokémon captured.

## Screens

### Pokédex

- Displays all Pokémon available in the Kanto region (first 151 Pokémon).
- Includes a search bar to filter Pokémon by name.
- Clicking on a Pokémon opens a detailed view of that Pokémon.

### Captured

- Displays the list of Pokémon captured by the trainer, sorted by their ID.
- Includes options to filter Pokémon by type and sort them alphabetically.
- Clicking on a Pokémon opens a detailed view of that Pokémon.

### Pokémon Detail

- Displays detailed information about the selected Pokémon, including:
    - Id
    - Name
    - Photo
    - Height and weight
    - Type
- Provides options to add or remove the Pokémon from the captured list.
- Captured Pokémon data is stored locally on the device.

## User Interface (UI)

- The default color palette for the application and top bar is "Red" or "Boston University Red".
- The color palette changes based on the types of captured Pokémon:
    - If the majority of captured Pokémon are of a specific type, the palette will be based on that type's color.
    - If there is no majority type or no captured Pokémon, the default palette is used.

## Extra Features

- User experience (UX) and graphical interface (UI) enhancements are appreciated.
- The project follows clean architecture principles and incorporates code quality control libraries.

## Installation and Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/D1f3r3nt/pokedex_petit.git
   cd pokedex_petit
