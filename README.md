# Robot Challenge
- Robot Challenge is a CLI based program written in Ruby Language. The goal of this program is to keep a robot within a grid of default size 5X5.
- The program uses Ruby 3.2.2 and is built using Object Oriented approach for easy addition of commands.
- The program was built imagining a Rails like system which boasts of Models like Robot and Grid which take care of the entities. And all operations on the models are stored under `commands` directory under `lib` folder.
- The commands are called/routed using `command_runner.rb` under `lib` folder to dynamically call the respective command execution file.
- The origin (0,0) is considered to be the South-West most corner.
- The grid size has been set by default to 5 and it can be changed in the `grid.rb` file by changing the `@x_position_limit` and `@y_position_limit` with a maximum value of `50`.

## Installation

Install dependencies

```bash
  bundle install
```

To run the tests

```bash
  rspec
```

To run the CLI program use the following command

- Run the program using the Ruby Interpreter

```bash
  ruby driver.rb start
```

- Run the program by executing the script directly by first making the script executable

```bash
  chmod +x driver.rb
```

```bash
  ./driver.rb start
```

## Commands

The following Commands are not case-sensitive.

The initial step is to place the Robot on the Grid by using the `PLACE` command, without which the rest of the commands wont run (except EXIT).

- **PLACE X,Y,DIRECTION**: Place the robot on the Grid, where X & Y in range 0 to 4, DIRECTION is NORTH, SOUTH, EAST or WEST.

  - Valid Input:
    
  ```bash
    PLACE 1,1,NORTH
  ```

  - Invalid Input:
    
  ```bash
    PLACE 1, 1, NORTH
  ```
  
- **MOVE**: Moves the Robot 1 step in the current Direction it faces. It does not accept arguments.

  - Valid Input:
    
  ```bash
    MOVE
  ```

  - Invalid Input:
    
  ```bash
    MOVE anything_else
  ```
  
- **LEFT** or **RIGHT**: Rotates the robot 90 degrees in the specified direction without changing the position of the robot. It does not accept arguments.

  - Valid Input:
    
  ```bash
    LEFT
  
    RIGHT
  ```

  - Invalid Input:
    
  ```bash
    LEFT anything_else
  
    RIGHT anything_else
  ```
  
- **REPORT**: Print the Current Position of the Robot. It does not accept arguments.

  - Valid Input:
    
  ```bash
    REPORT
  ```

  - Invalid Input:
    
  ```bash
    REPORT anything_else
  ```
  
- **CLEAR**: Clears the screen.  It does not accept arguments.

  - Valid Input:
    
  ```bash
    CLEAR
  ```
  
- **HELP**: Prints the commands menu.  It does not accept arguments.

  - Valid Input:
    
  ```bash
    HELP
  ```  
- **EXIT**: Exit the program.

  - Valid Input:
    
  ```bash
    EXIT
  ```  
  
