#!/usr/bin/env ruby
require 'thor'
require 'colorize'
require './lib/command_runner'

class Driver < Thor

  desc "start", "Start the Interactive CLI"
  def start
    @command_runner = CommandRunner.new

    puts "Welcome to the Robot Challenge!".colorize(:green)
    puts "Type 'HELP' for a list of available commands.".colorize(:green)
    puts "Type 'EXIT' to exit the program.".colorize(:green)
    input = ""

    loop do
      print "> "
      input = STDIN.gets&.chomp&.downcase
      next if input.nil? || input.empty?

      case input
      when "help"
        show_help_options
      when "clear"
        clear_screen
      when "exit"
        puts "Challenge Exited :)"
        break
      else
        @command_runner.run(input)
      end
    end
  end

  private

  def clear_screen
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system 'cls'
    else
      system 'clear'
    end
  end

  def show_help_options
    puts "Available commands:".colorize(:green)
    puts "- PLACE X,Y,DIRECTION: Place the robot on the Grid, where X & Y are positions, DIRECTION is NORTH, SOUTH, EAST or WEST".colorize(:green)
    puts "- MOVE: Moves the Robot 1 step in the current Direction it faces.".colorize(:green)
    puts "- LEFT or RIGHT: Rotates the robot 90 degrees in the specified direction without changing the position of the robot.".colorize(:green)
    puts "- REPORT: Print the Current Position of the Robot.".colorize(:green)
    puts "- CLEAR: Clears the screen.".colorize(:green)
    puts "- EXIT: Exit the program".colorize(:green)
  end
end

Driver.start(ARGV)
