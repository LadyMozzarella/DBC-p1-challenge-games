# Boggle 1 Basic Board Generation

##Learning Competencies

* Model a simple real-world procedure in Ruby.
* Method definition, arguments, and return values
* Common string methods
* Internal representation vs. display representation

##Summary

We're going to create a basic Boggle board generator. Read about [Boggle on Wikipedia](http://en.wikipedia.org/wiki/Boggle) if you're not familiar with the game.

Boggle is a simple game, but when you get down into it there are some subtleties.

First, we're only going to model the first part of boggle, where you place the Boggle dice and shake them around to create the initial board. To imagine what that might look like, visualize a blank 4x4 grid with a button next to it. When you push the button a letter appears in each of the 16 cells and you can begin playing Boggle.

We're going to do it in two steps. First, we'll to build a dumb version which doesn't care at all about whether it's likely that the Boggle board will have English words. Second, we'll build a version that models the dice.

**Please Note:** Start with sample code from the original gist above. It gives a hint on class structure and internal methods.

##Releases

###Release 0 : Simple Boggle Board

Our `BoggleBoard` class has one core instance method: `shake!`

For the first step, focus on how you represent the board. `shake!` should modify the board, filling each cell with a random upper-case letter `A-Z`.

There are no other restrictions on the letters. They can appear multiple times, for example. Just pick a random letter and don't sweat it.

I also know you're worrying about how "Q" is always "Qu" in Boggle. Stop! Just let it be "Q" for now.

We want to write code that works like this:

```ruby
board = BoggleBoard.new
puts board
# An unshaken board prints out something sensible, like:
# ____
# ____
# ____
# ____

# Shake (and modify) the board
board.shake!

puts board
# Prints out:
# DUMV
# KSPD
# HCDA
# ZOHG

board.shake!
puts board

# We've shaken again, so a new random board:
# QIRZ
# EEBY
# OEJE
# MHCU
```

###Release 1 : Smart(er) Boggle Board

We need to model the dice, now. Think carefully about how shaking a Boggle board works. Each die lands in one and only one cell, with one side facing up.

Can you think of a way to model a die landing in only one cell without explicitly keeping track of which dice have landed and which haven't? One way to do this is using a secondary `Array`, can you think of another?

We'll still only have one core method, `BoggleBoard#shake!`. Here's a list of Boggle dice, with "Q" representing "Qu":

```text
AAEEGN
ELRTTY
AOOTTW
ABBJOO
EHRTVW
CIMOTU
DISTTY
EIOSST
DELRVY
ACHOPS
HIMNQU
EEINSU
EEGHNW
AFFKPS
HLNNRZ
DEILRX
```

###Release 2 : Dealing with Q

Assuming we want "Qu" to be printed rather than "Q", how could we make that happen?

There are several ways of making this happen, especially if you keep in mind that how the board appears to the computer, how it's represented in your program, doesn't have to be how it appears to the person using the program.

Consider a few ways to make "Qu" print instead of just "Q", deliberate on the tradeoffs for a few minutes, and implement one. You'll probably want to change how the board is printed, too, since "Qu" will throw everything out of alignment.

For example, something like this might be appropriate:

```text
> puts board.shake!
U  N  O  T
S  E  W  G
S  V  L  T
L  Qu C  F
```

Check out the [String#ljust](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-ljust) method for an easy way to add the right amount of space for display.


##Optimize Your Learning

As you're coding, ask yourself:
  * Do I have a clear understanding of how this procedure works?
  * Am I stuck because I know what I want to do but don't know how to say it in Ruby?
  * Am I stuck because my understanding of how Boggle works is too fuzzy or mistaken?


##Resources

* [Boggle on Wikipedia](http://en.wikipedia.org/wiki/Boggle)
* [Play Boggle online](http://www.wordplays.com/boggle)
* [String#ljust](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-ljust)
