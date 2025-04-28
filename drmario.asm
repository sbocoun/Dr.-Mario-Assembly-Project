################# CSC258 Assembly Final Project ###################
# This file contains my implementation of Dr Mario.
#
# Student 1: Simon Bocoun, 1008535015
#
# I assert that the code subitted here is entirely my own 
# creation, and will indicate otherwise when it is not.
#
######################## Bitmap Display Configuration ########################
# - Unit width in pixels:       1
# - Unit height in pixels:      1
# - Display width in pixels:    32
# - Display height in pixels:   32
# - Base Address for Display:   0x10008000 ($gp)
##############################################################################
    .data
##############################################################################
# Immutable Data
##############################################################################
EASY:
    #   x,   y, len, type
    # E
    .word  0,  0,  5, 1
    .word  0,  0,  4, 0
    .word  0,  2,  3, 0
    .word  0,  4,  4, 0
    # A
    .word  5, 0,  5, 1
    .word  8, 0,  5, 1
    .word  6, 0,  2, 0
    .word  6, 2,  2, 0
    # S
    .word  10, 0,  4, 0
    .word  10, 0,  3, 1
    .word  10, 2,  4, 0
    .word  13, 2,  3, 1
    .word  10, 4,  4, 0
    # Y
    .word  15, 0,  3, 1
    .word  18, 0,  3, 1
    .word  16, 2,  3, 1
    .word  17, 2,  3, 1
    .word -1

EASY_OFFSET:
    .word  6, 5

MEDIUM:
    #   x,   y, len, type
    # M
    .word  0,  0,  5, 1
    .word  1,  1,  1, 0
    .word  2,  2,  1, 0
    .word  3,  1,  1, 0
    .word  4,  0,  5, 1
    # E
    .word  6,  0,  5, 1
    .word  6,  0,  4, 0
    .word  6,  2,  3, 0
    .word  6,  4,  4, 0
    # D
    .word  11, 0,  5, 1
    .word  11, 0,  3, 0
    .word  13, 1,  2, 0
    .word  14, 2,  1, 0
    .word  13, 3,  2, 0
    .word  11, 4,  3, 0
    # I
    .word  16, 0,  5, 1
    # U
    .word  18, 0,  5, 1
    .word  19, 4,  2, 0
    .word  21, 0,  5, 1
    # M
    .word  23,  0,  5, 1
    .word  24,  1,  1, 0
    .word  25,  2,  1, 0
    .word  26,  1,  1, 0
    .word  27,  0,  5, 1
    .word -1

MEDIUM_OFFSET:
    .word  2, 12

HARD:
    #   x,   y, len, type
    # H
    .word  0,  0,  5, 1
    .word  0,  2,  4, 0
    .word  3,  0,  5, 1
    # A
    .word  5, 0,  5, 1
    .word  8, 0,  5, 1
    .word  6, 0,  2, 0
    .word  6, 2,  2, 0
    # R
    .word  10, 0,  5, 1
    .word  10, 0,  4, 0
    .word  13, 1,  1, 0
    .word  10, 2,  4, 0
    .word  12, 3,  1, 0
    .word  13, 4,  1, 0
    
    # D
    .word  15, 0,  5, 1
    .word  15, 0,  3, 0
    .word  17, 1,  2, 0
    .word  18, 2,  1, 0
    .word  17, 3,  2, 0
    .word  15, 4,  3, 0
    .word -1

HARD_OFFSET:
    .word  6, 19
    
GAME_OVER_SCREEN:
    #   x,   y, len, type
    # G
    .word  2,  0,  5, 1
    .word  2,  0,  4, 0
    .word  2,  4,  4, 0
    .word  4,  2,  2, 0
    .word  5,  2,  3, 1
    # A
    .word  7, 0,  5, 1
    .word  10, 0,  5, 1
    .word  8, 0,  2, 0
    .word  8, 2,  2, 0
    # M
    .word  12,  0,  5, 1
    .word  13,  1,  1, 0
    .word  14,  2,  1, 0
    .word  15,  1,  1, 0
    .word  16,  0,  5, 1
    # E
    .word  18,  0,  5, 1
    .word  18,  0,  4, 0
    .word  18,  2,  3, 0
    .word  18,  4,  4, 0

    # O
    .word  2,  7,  5, 1
    .word  2,  7,  4, 0
    .word  2, 11, 4, 0
    .word  5,  7,  5, 1
    # V
    .word  7, 7,  4, 1
    .word  8, 11,  2, 0
    .word  10, 7,  4, 1
    # E
    .word  12,  7,  5, 1
    .word  12,  7,  4, 0
    .word  12,  9,  3, 0
    .word  12,  11,  4, 0
    # R
    .word  17, 7,  5, 1
    .word  17, 7,  4, 0
    .word  20, 8,  1, 0
    .word  17, 9,  4, 0
    .word  19, 10,  1, 0
    .word  20, 11,  1, 0
    # .
    .word  22, 11, 1, 0
    # S
    .word  0, 15, 4, 0
    .word  0, 15, 3, 1
    .word  0, 17, 4, 0
    .word  3, 17, 3, 1
    .word  0, 19, 4, 0
    # C
    .word  5, 15, 5, 1
    .word  5, 15, 4, 0
    .word  5, 19, 4, 0
    # O
    .word  10, 15, 5, 1
    .word  10, 15, 4, 0
    .word  10, 19, 4, 0
    .word  13, 15, 5, 1
    # R
    .word  15, 15,  5, 1
    .word  15, 15,  4, 0
    .word  18, 16,  1, 0
    .word  15, 17,  4, 0
    .word  17, 18,  1, 0
    .word  18, 19,  1, 0
    # E
    .word  20,  15,  5, 1
    .word  20,  15,  4, 0
    .word  20,  17,  3, 0
    .word  20,  19,  4, 0
    # COLON
    .word  25, 16, 1, 0
    .word  25, 18, 1, 0
    .word -1

GAME_OVER_OFFSET:
    .word  3, 2

DIGIT_0:
    .word  0, 0, 3, 0   
    .word  0, 0, 5, 1   
    .word  2, 0, 5, 1
    .word  0, 4, 3, 0   
    .word -1            

DIGIT_1:
    .word  1, 0, 5, 1   
    .word -1            

DIGIT_2:
    .word  0, 0, 3, 0   
    .word  2, 0, 3, 1   
    .word  0, 2, 3, 0   
    .word  0, 2, 3, 1   
    .word  0, 4, 3, 0   
    .word -1            

DIGIT_3:
    .word  0, 0, 3, 0   
    .word  2, 0, 5, 1   
    .word  0, 2, 3, 0   
    .word  0, 4, 3, 0   
    .word -1            

DIGIT_4:
    .word  0, 0, 3, 1   
    .word  0, 2, 3, 0   
    .word  2, 0, 5, 1   
    .word -1            

DIGIT_5:
    .word  0, 0, 3, 0   
    .word  0, 0, 3, 1   
    .word  0, 2, 3, 0   
    .word  2, 2, 3, 1   
    .word  0, 4, 3, 0   
    .word -1            

DIGIT_6:
    .word  0, 0, 3, 0   
    .word  0, 0, 5, 1   
    .word  0, 2, 3, 0   
    .word  2, 2, 3, 1   
    .word  0, 4, 3, 0   
    .word -1            

DIGIT_7:
    .word  0, 0, 3, 0   
    .word  2, 0, 5, 1   
    .word -1            

DIGIT_8:
    .word  0, 0, 3, 0   
    .word  0, 0, 5, 1   
    .word  2, 0, 5, 1   
    .word  0, 2, 3, 0   
    .word  0, 4, 3, 0   
    .word -1            

DIGIT_9:
    .word  0, 0, 3, 0   
    .word  0, 0, 3, 1   
    .word  2, 0, 5, 1   
    .word  0, 2, 3, 0   
    .word  0, 4, 3, 0   
    .word -1

NULL_DIGIT:
    .word  0, 0, 5, 1
    .word  1, 0, 5, 1
    .word  2, 0, 5, 1
    .word -1

DIGIT_JUMP_TABLE:
    .word DIGIT_0, DIGIT_1, DIGIT_2, DIGIT_3, DIGIT_4
    .word DIGIT_5, DIGIT_6, DIGIT_7, DIGIT_8, DIGIT_9

# Goes from least significant to most significant.
DIGIT_OFFSETS:
    .word 28, 2
    .word 24, 2
    .word 20, 2
    .word 9, 2
    .word 5, 2
    .word 1, 2

ENDGAME_DIGIT_OFFSETS:
    .word 24, 24
    .word 20, 24
    .word 16, 24
    .word 12, 24
    .word 8, 24
    .word 4, 24  

# The shape of the pill bottle to draw.
BOTTLE_LINES:
        #   x,   y, len, type
    .word   0,  21,  10, 0   # Bottom of the bottle
    .word   0,   4,  18, 1   # Left side
    .word   9,   4,  18, 1   # Right side
    .word   0,   4,   3, 0   # Left shoulder
    .word   6,   4,   3, 0   # Right shoulder
    .word   3,   2,   3, 1   # Left neck
    .word   6,   2,   3, 1   # Right neck
    .word   2,   0,   3, 1   # Left lip
    .word   7,   0,   3, 1   # Right lip
    .word  -1                # End

BOTTLE_OFFSETS:
    .word 11    # X offset of the bottle.
    .word 8     # Y offset of the bottle.

BOTTLE_COLOR:
    .word 0x808080
    
# The address of the bitmap display. Don't forget to connect it!
ADDR_DSPL:
    .word 0x10008000
    
# The address of the keyboard. Don't forget to connect it!
ADDR_KBRD:
    .word 0xffff0000

 # Capsule nub colors.
CAPSULE_COLOR_TABLE:
    .word 0xe40058      # Red
    .word 0x3cbcfc      # Blue
    .word 0xf0bc3c      # Yellow
    
 # Virus nub colors.
VIRUS_COLOR_TABLE:
    .word 0xe40059      # Red
    .word 0x3cbdfd      # Blue
    .word 0xf0bc3d      # Yellow

EDGE_BOUNDS:
    .word 8     # X coordinate of the right wall boundary
    .word 16    # Y coordinate of the floor boundary

GAME_AREA_OFFSETS:
    .word 12    # X offset of the game area.
    .word 13     # Y offset of the game area.

# Imports the song data
# Label name is NOTE_DATA
# Format: Start Time, Instrument, Key, Volume, Duration
.include "drm_chilltheme1.txt"

##############################################################################
# Mutable Data
##############################################################################

# Stores the previous value of ADDR_KBRD
KBRD_PREV_STATE:
    .word 0

# Flag for whether or not to stop moving a pill and incorporate it as part of the game area.
PILL_LOCK:
    .word 1

# Timer that enables soft landing logic
PILL_LOCK_TIMER:
    .word 0

# Flag for whether or not any floating nubs were dropped during the last gravity tick.
NUB_TO_DROP_EXISTS:
      # Curr, Prev
    .word  0,  0

CURR_PILL:
       #   x,   y,  color
    .word   0,  0,  0       # left/bottom capsule nub
    .word   0,  0,  0       # right/top capsule nub
        #   Orientation     # 0 is horizontal, 1 is vertical
    .word   0

NEW_PILL:
       #   x,   y,  color
    .word   0,  0,  0       # left/bottom capsule (nub 1)
    .word   0,  0,  0       # right/top capsule (nub 2)
        #   Orientation     # 0 is horizontal, 1 is vertical
    .word   0

# Array representing the game area. Objects occupying an area are represented by their color.
PILL_BOTTLE:            
    .space 512          # [16 rows][8 coluns] with 4 bytes (1 word) per space.

# Array representing the game area; meant to store additional information about which nubs are
# still connected to other nubs, and thus shouldn't be dropped down. Viruses are still represented
# by their colors, and the positions of connected nubs hold the address of their partner on this array.
# Both empty tiles and "floating" capsule nubs are represented with 0.
NUB_PARTNERS:
    .space 512

GRAVITY_INFO:
        #   Count, Intensity, Intensity_count
    .word   0,      30,       0     # Starts out at (16 s) * (30 cycles per second) 2 drops per second.

VIRUSES_TO_SPAWN:        # The number of viruses to spawn (by a factor of 4)
    .word   1

# The number of viruses on the game board during the last game loop.
VIRUS_COUNT:
    .word  0

MUSIC_TIMER:
        #   Count, Maximum, Pointer into NOTE_DATA
    .word  0,      125979,  0

DIFFICULTY_STATE:
    .word, 0

SCORE:
    .word, 0

# Keeps track of the number of chain reactions style matches
# that've been triggered in a row. Set to 1 by default
CHAIN_REACTION_COUNT:
    .word,  1

VIRUSES_ELIMINATED:
        # Curr, Prev
    .word,  0,  0

##############################################################################
# MACROS
##############################################################################

.macro push (%item)
    addi $sp, $sp, -4
    sw %item, 0($sp)
.end_macro

.macro pop (%item)
  lw %item, 0($sp)
  addi $sp, $sp, 4
.end_macro

##############################################################################
# Code
##############################################################################
	.text
	.globl main

# Run the game.  
main:

        # Initialize the game:
    
        # Connect the display + keyboard
        lw $s0, ADDR_DSPL       
        lw $s1, ADDR_KBRD

        # Prompt the user to choose a difficulty
        jal draw_start_menu
        jal select_difficulty

        # Draw the pill bottle
        la $a0, BOTTLE_OFFSETS
        la $a1, BOTTLE_LINES
        lw $a2, BOTTLE_COLOR
        jal draw_shape
        
        # Spawn the first pill.
        jal spawn_pill
        
        # Spawn the viruses.
        la $a0, VIRUSES_TO_SPAWN
        lw $a0, 0($a0)
        jal spawn_viruses

        # Prepare to play music
        jal music_prep

game_loop:

    # 0. Update CURR_PILL and NEW_PILL.

        la $a0, NEW_PILL
        la $a1, CURR_PILL
        jal copy_pill_args
        # Store the in $s2, $s3 respectively.
        la $s2, NEW_PILL
        la $s3, CURR_PILL
        
    # 1a. Check if a key has been pressed
    
        # If the capsule's position is locked, don't move.
        lw $t0, PILL_LOCK
        beq $t0, 1, check_collisions
        # Otherwise read the keyboard state
        lw $a0, 0($s1)
        # If a key was pressed, read it
        beq $a0, 1, read_key
        # Else update the state in memory + skip to a check for collisions
        la $t0, KBRD_PREV_STATE
        sw $a0, 0($t0)
        j check_collisions
    
    # 1b. Check which key has been pressed
    
        read_key:
        # Load a second word from the keyboard
        lw $a1, 4($s1)
        # Check whether to quit the game
        beq $a1, 0x71, quit_game
        # Check if a capsule move is warranted.
        jal check_want_to_move
        # Respond according to which key was pressed.
        beq $a1, 0x77, rotate_capsule           # W was pressed
        beq $a1, 0x61, move_capsule_left        # A was pressed
        beq $a1, 0x73, drop_capsule_down        # S was pressed
        beq $a1, 0x64, move_capsule_right       # D was pressed
    
    # 2a. Check for collisions
    
        check_collisions:
        jal check_gravity                   # Apply gravity to NEW_PILL as necessary
        jal check_wall_collisions           # Check whether the new position overlaps the bottle walls
        jal check_gameboard_collisions      # Check whether the new position overlaps another capsule or virus.
        jal check_floor_collisions          # Check whether the pill has clipped into the floor.
        jal lock_pill_position              # If the pill is at floor or pill/virus level, lock it's position.

	# 2b. Update locations (capsules)
              
        jal check_for_matches               # Check for any matches of 4+.
        jal drop_orphaned_nubs              # If there are currently any orphaned nubs, drop them down a row.
        jal update_score                    # Update the score if necessary.
        jal spawn_pill                      # Spawn a new capsule if necessary.
        jal check_game_over                 # Check whether the bottle neck is blocked.
	
	# 3. Draw the screen

        draw_screen:
        # TODO: instead of drawing directly to the screen, move to a screen buffer instead then draw it.
        jal draw_game_board
      	jal draw_pill
        la $a0, DIGIT_OFFSETS
        jal draw_score

	# 4. Sleep

    	li $v0, 32
        li $a0, 10  # Delays about 60 times per second.
        syscall
        
    # 5. Play a note if necessary.

        jal play_note
    
    # 6. Go back to Step 1
    
        j game_loop


##############################################################################
# SCORE CALCULATION FUNCTIONS
##############################################################################

# Add to the score according to the number of viruses eliminated in the current 
# turn, whether a combo has been performed, and the current difficulty.
update_score:
    # Save the return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Load the previous number of viruses
    lw $s4, VIRUS_COUNT($zero)
    # Calculate the current number of viruses (in NUB_PARTNERS)
    jal calculate_virus_count
    move $s5, $v0
    # Do nothing if the current number of viruses hasn't decreased.
    bge $s5, $s4, end_update_score
    # Calculate the base score per virus based on the selected difficulty.
    jal find_virus_score
    # Apply a multiplier according to the number of viruses eliminated this turn
    sub $a0, $s4, $s5              # Number of viruses eliminated
    move $a1, $v0                  # Base virus score
    jal apply_per_virus_multiplier
    # Next check and, if necessary, apply a chain reaction multiplier.
    move $a0, $v0
    jal check_chain_reaction_multiplier
    # Then add the current move's score to the total score.
    lw $t0, SCORE($zero)
    add $t0, $t0, $v0
    sw $t0, SCORE($zero)
    # then return

    end_update_score:
    # Update the previous number of viruses
    sw $s5, VIRUS_COUNT($zero)
    # Load the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Generates a virus score according to the selected difficulty
    # $v0: the number of points awarded per virus eliminated.
find_virus_score:
    # Load the current difficulty
    lw $t0, DIFFICULTY_STATE
    # Branch according to the difficulty
    beq $t0, 0, easy_points
    beq $t0, 1, medium_points
    beq $t0, 2, hard_points

    easy_points:
    li $v0, 100
    jr $ra

    medium_points:
    li $v0, 300
    jr $ra

    hard_points:
    li $v0, 500
    jr $ra

# Multiply the base score by a multiplpier determined by the number of 
# viruses eliminated simultaneously in a single turn.
    # $a0: the # of viruses simultaneously eliminated
    # $a1: the base score
    # $v0: the resulting score.
apply_per_virus_multiplier:
    # Branch according to the # of viruses eliminated
    beq $a0, 1, one_virus_multiplier
    beq $a0, 2, two_virus_multiplier
    beq $a0, 3, three_virus_multiplier
    bge $a0, 4, four_plus_multiplier
    # This point shouldn't be reached
    jr $ra

    one_virus_multiplier:
    mul $v0, $a1, 1
    jr $ra

    two_virus_multiplier:
    mul $v0, $a1, 3
    jr $ra

    three_virus_multiplier:
    mul $v0, $a1, 6
    jr $ra

    four_plus_multiplier:
    mul $v0, $a1, 10
    jr $ra

# Checks whether a chain reaction style elimination (when nubs dropped by gravity form 
# a match of 4+) has occured and applies a score bonus according to how many in a row 
# occured.
    # $a0: the current move's score
check_chain_reaction_multiplier:
    # First check whether a chain reaction is occuring (i.e., whether 
    # a match has been made by nubs dropped bec. of a previous match)
    # Can happen when either 1. nubs are still being dropped
    la $t0, NUB_TO_DROP_EXISTS
    lw $t1, 0($t0)
    lw $t2, 4($t0)
    and $t1, $t1, $t2
    beq $t1, 1, apply_chain_reaction_multiplier
    # Or 2. when nubs have just finished being dropped.
    lw $t1, 0($t0)
    lw $t2, 4($t0)
    neg $t2, $t2
    beq $t1, 1, apply_chain_reaction_multiplier
    # Otherwise reset the chain reaction counter then return
    li $t0, 1
    sw $t0, CHAIN_REACTION_COUNT($zero)
    jr $ra

    apply_chain_reaction_multiplier:
    lw $t0, CHAIN_REACTION_COUNT
    # Branch according to the number of consecutive 
    # chain reaction matches
    beq $t0, 1, first_chain_reaction
    beq $t0, 2, second_chain_reaction
    bge $t0, 3, third_plus_chain_reaction

    # Triggers upon the first match triggered as
    # part of a chain reaction (after the initial 
    # match).
    first_chain_reaction:
    mul $v0, $a0, 2
    jr $ra

    second_chain_reaction:
    mul $v0, $a0, 3
    jr $ra

    third_plus_chain_reaction:
    mul $v0, $a0, 4
    jr $ra


# Counts the number of virus occurences in the NUB_PARTNERS array.
    # $v0: the number of virus occurences
calculate_virus_count:
    la $t0, NUB_PARTNERS
    la $t1, NUB_PARTNERS
    addi $t1, $t1, 512
    li $t9, 0
    virus_count_loop:
    beq $t0, $t1, virus_count_end
    lw $t2, 0($t0)
    beq $t2, 2, virus_found
    # No virus there
    addi $t0, $t0, 4
    j virus_count_loop

    virus_found:
    addi $t9, $t9, 1
    addi $t0, $t0, 4
    j virus_count_loop

    virus_count_end:
    move $v0, $t9
    jr $ra

##############################################################################
# GAME OVER FUNCTIONS
##############################################################################

# go to a game over state if the pill bottle has filled up.
check_game_over:
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Check whether the capsule has been newly reset to it's starting position (3, 0 for the left nub)
    lw $t0, 4($s2)
    bne $t0, 0, game_continues
    # Check whether the position on the game board is occupied by a static capsule.
    la $t0, PILL_BOTTLE
    li $a0, 3
    li $a1, 0
    jal coordinates_to_pill_bottle
    lw $t0, 0($v0)
    bne $t0, 0, game_ends
    # If not, keep playing
    j game_continues
    
    game_ends:
    jal draw_game_over
    j game_over_state
    
    game_continues:
    # Load the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Draw the game over screen.
draw_game_over:
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # clear the display
    jal draw_black_screen
    # Draw the game over screen over it.
    la $a0, GAME_OVER_OFFSET
    la $a1, GAME_OVER_SCREEN
    la $a2, 0xffffff
    jal draw_shape
    # Draw the final score
    la $a0, ENDGAME_DIGIT_OFFSETS
    jal draw_score
    # Load the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Fills the entire bitmap with black.
draw_black_screen:
    lw $t7, ADDR_DSPL
    li $t8, 0
    addi $t9, $t7, 4096
    black_screen_loop:
    beq $t7, $t9, draw_black_screen_end
    sw $t8, 0($t7)
    addi $t7, $t7, 4
    j black_screen_loop
    draw_black_screen_end:
    jr $ra

# Wait for user keypresses. Only valid options are to quit or restart the game.
game_over_state:
    # Read the keyboard state
    lw $a0, 0($s1)
    # If a key was pressed, read it
    beq $a0, 1, read_game_over_state_key
    # Else wait and try again
    j wait_on_end

    read_game_over_state_key:
    # Load a second word from the keyboard
    lw $a1, 4($s1)
    # Respond according to which key was pressed.
    beq $a1, 0x71, quit_game                    # Q was pressed
    beq $a1, 0x0a, new_game                     # Enter was pressed
    # If it wasn't one of these, keep waiting

    wait_on_end:
    li $v0, 32
    li $a0, 10  # Delays about 60 times per second.
    syscall
    j game_over_state


# Initializes a new game if one finished but the player has opted to keep playing.
new_game:
    # Much of the mutable data either doesn't need to be changed, or is set by the
    # initial function calls. Mainly the game data arrays need to be reset and also the
    # music timer.
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Reset the PILL_BOTTLE array
    la $a0, PILL_BOTTLE
    jal clear_game_array
    # Reset the NUB_PARTNERS array 
    la $a0, NUB_PARTNERS
    jal clear_game_array
    # Reset the MUSIC_TIMER
    sw $zero, MUSIC_TIMER($zero)
    # Reset the gravity intensity timer 
    la $t0, GRAVITY_INFO
    sw $zero, 8($t0)
    # Clear the screen
    jal draw_black_screen
    # Reset the chosen difficulty
    sw $zero, DIFFICULTY_STATE($zero)
    # Reset the score
    lw $zero, SCORE($zero)
    # Go to the start of the game.
    j main
    
# Takes in the address of a 512 space in memory and sets each word to 0.
    # $a0: the address of the space to clear.
clear_game_array:
    move $t9, $a0
    addi $t9, $t9, 512
    li $t0, 0
    clear_array_loop:
    beq $a0, $t9, clear_array_end
    sw $t0, 0($a0)
    addi $a0, $a0, 4
    j clear_array_loop

    clear_array_end:
    jr $ra
    

##############################################################################
# START MENU FUNCTIONS
##############################################################################

# Draws the difficulty options to the screen
draw_start_menu:
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Draw "easy"
    la $a0, EASY_OFFSET
    la $a1, EASY
    li $a2, 0xff0000
    jal draw_shape
    # Draw "medium"
    la $a0, MEDIUM_OFFSET
    la $a1, MEDIUM
    li $a2, 0xffffff
    jal draw_shape
    # Draw "hard"
    la $a0, HARD_OFFSET
    la $a1, HARD
    li $a2, 0xffffff
    jal draw_shape
    # Load the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Jump between the difficulties (showing the selected one in a different color)
# using the W and S keys until ENTER is pressed.
select_difficulty:
        # Read the keyboard state
        lw $a0, 0($s1)
        # If a key was pressed, read it
        beq $a0, 1, read_start_menu_key
        # Else wait and try again
        j wait_on_selection
    
        read_start_menu_key:
        # Load a second word from the keyboard
        lw $a1, 4($s1)
        # Save the return address
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        # Respond according to which key was pressed.
        beq $a1, 0x77, lower_the_difficulty         # W was pressed
        beq $a1, 0x73, raise_the_difficulty         # S was pressed
        beq $a1, 0x0a, set_up_the_game              # Enter was pressed
        # If it wasn't one of these, keep waiting
        j wait_on_selection

        lower_the_difficulty:
        lw $t0, DIFFICULTY_STATE
        beq $t0, 0, wait_on_selection           # Do nothing if the difficulty is already at its lowest.
        addi $t0, $t0, -1
        sw $t0, DIFFICULTY_STATE($zero)
        jal update_difficulty_menu
        # Retrieve the return address
        lw $ra, 0($sp)
        addi $sp $sp, 4
        j wait_on_selection

        raise_the_difficulty:
        lw $t0, DIFFICULTY_STATE
        beq $t0, 2, wait_on_selection           # Do nothing if the difficulty is already at its highest.
        addi $t0, $t0, 1
        sw $t0, DIFFICULTY_STATE($zero)
        jal update_difficulty_menu
        # Retrieve the return address
        lw $ra, 0($sp)
        addi $sp $sp, 4
        j wait_on_selection

        set_up_the_game:
        jal initialize_selected_difficulty
        # Return outside the scope of the start_menu function
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra
        
        wait_on_selection:
        li $v0, 32
        li $a0, 10  # Delays about 60 times per second.
        syscall
        j select_difficulty

# Redraw the difficulty menu according to the currently selected difficulty.
update_difficulty_menu:
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Branch according to the difficulty level.
    lw $t0, DIFFICULTY_STATE
    beq $t0, 0, select_easy
    beq $t0, 1, select_medium
    beq $t0, 2, select_hard

    select_easy:
    # Draw "easy"
    la $a0, EASY_OFFSET
    la $a1, EASY
    li $a2, 0xff0000
    jal draw_shape
    # Draw "medium"
    la $a0, MEDIUM_OFFSET
    la $a1, MEDIUM
    li $a2, 0xffffff
    jal draw_shape
    # Draw "hard"
    la $a0, HARD_OFFSET
    la $a1, HARD
    li $a2, 0xffffff
    jal draw_shape
    j update_difficulty_menu_end

    select_medium:
    # Draw "easy"
    la $a0, EASY_OFFSET
    la $a1, EASY
    li $a2, 0xffffff
    jal draw_shape
    # Draw "medium"
    la $a0, MEDIUM_OFFSET
    la $a1, MEDIUM
    li $a2, 0xff0000
    jal draw_shape
    # Draw "hard"
    la $a0, HARD_OFFSET
    la $a1, HARD
    li $a2, 0xffffff
    jal draw_shape
    j update_difficulty_menu_end

    select_hard:
    # Draw "easy"
    la $a0, EASY_OFFSET
    la $a1, EASY
    li $a2, 0xffffff
    jal draw_shape
    # Draw "medium"
    la $a0, MEDIUM_OFFSET
    la $a1, MEDIUM
    li $a2, 0xffffff
    jal draw_shape
    # Draw "hard"
    la $a0, HARD_OFFSET
    la $a1, HARD
    li $a2, 0xff0000
    jal draw_shape
    j update_difficulty_menu_end

    update_difficulty_menu_end:
    # Load the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Change the gravity intensity and number of viruses according to the selected difficulty.
initialize_selected_difficulty:
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Branch according to the difficulty level.
    lw $t0, DIFFICULTY_STATE
    beq $t0, 0, initialize_easy
    beq $t0, 1, initialize_medium
    beq $t0, 2, initialize_hard

    initialize_easy:
    la $t0, GRAVITY_INFO
    li $t1, 40
    sw $t1, 4($t0)
    li $t1, 1
    sw $t1, VIRUSES_TO_SPAWN($zero)
    j initialize_end

    initialize_medium:
    la $t0, GRAVITY_INFO
    li $t1, 30
    sw $t1, 4($t0)
    li $t1, 3
    sw $t1, VIRUSES_TO_SPAWN($zero)
    j initialize_end

    initialize_hard:
    la $t0, GRAVITY_INFO
    li $t1, 20
    sw $t1, 4($t0)
    li $t1, 5
    sw $t1, VIRUSES_TO_SPAWN($zero)
    j initialize_end

    initialize_end:
    # Draw over the menu options with black
    # Draw "easy"
    la $a0, EASY_OFFSET
    la $a1, EASY
    li $a2, 0x000000
    jal draw_shape
    # Draw "medium"
    la $a0, MEDIUM_OFFSET
    la $a1, MEDIUM
    li $a2, 0x000000
    jal draw_shape
    # Draw "hard"
    la $a0, HARD_OFFSET
    la $a1, HARD
    li $a2, 0x000000
    jal draw_shape
    # Load the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    

##############################################################################
# MUSIC FUNCTIONS
##############################################################################

# Save a pointer to NOTE_DATA in MUSIC_TIMER and synchronously plays to each
# instrument the track will use.
  music_prep:
    # Saves a pointer to NOTE_DATA in MUSIC_TIMER
    la $t0, MUSIC_TIMER
    la $t1, NOTE_DATA
    sw $t1, 8($t0)
    # Play a 0ms synchronous midi note of each instrument, which "tells saturn 
    # to load the sound file and resume your program once the audio file has been loaded."
    li $v0, 33
    li $a0, 0
    li $a1, 0
    li $a2, 0
    li $a3, 0
    syscall
    li $a2, 27
    syscall
    li $a2, 33
    syscall
    li $a2, 56
    syscall
    li $a2, 67
    syscall
    li $a2, 80
    syscall
    li $a2, 93
    syscall
    li $a2, 99
    syscall
    li $a2, 118
    syscall
    li $a2, 128
    syscall

# Check whether or not a note needs to be played given the "clock"/timer. 
# Does so in increments of 17 because currently, the game loop only executes 
# every 17 milliseconds (i.e. at 60 hz).
play_note:
    # Load the timer information
    la $t0, MUSIC_TIMER
    lw $t1, 0($t0)      # The current timer "count"
    lw $t2, 4($t0)      # The maximum "count"
    # Load the address of the next note to play from NOTE_DATA
    lw $t3, 8($t0) 
    # Check whether there's been a new note(s) since the last interval to play.
    play_note_loop:
    lw $t4, 0($t3)               # Load the start time of the note.
    beq $t4, -1, restart_song    # If we've reached the end of the song, restart
    bgt $t4, $t1, play_note_end  # If the start time is ahead of the timer, wait until the next cycle.
    # Then load the other aspects of the note to play and execute a syscall
    li $v0, 31       # The MIDI Out syscall signal
    lw $a0, 8($t3)   # The pitch to play at 
    lw $a1, 16($t3)  # The duration to play for 
    lw $a2, 4($t3)   # The instrument to play
    lw $a3, 12($t3)  # The volume to play at
    syscall
    # Then move over the pointer in MUSIC_TIMER and check again
    # in case another instrument is playing at the same time or 
    # within the same 17 ms interval.
    addi $t3, $t3, 20
    sw $t3, 8($t0)
    j play_note_loop

    play_note_end:
    # Increment the timer and return.
    addi $t1, $t1, 17
    sw $t1, 0($t0)
    jr $ra
    
    restart_song:
    # Restart the counter
    la $t0, MUSIC_TIMER
    li $t1, 0
    sw $t1, 0($t0)
    # Reset the pointer in MUSIC_TIMER to the beginning of the restart_song
    la $t1, NOTE_DATA
    sw $t1, 8($t0)
    # Re-run the function
    j play_note

##############################################################################
# MATCH FUNCTIONS
##############################################################################

# Check the game board for rows or columns of 4+ consecutive colors, and eliminate
# them if so. Colors is meant in a relative sense (treats virus/pill colors identically).
check_for_matches:
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # The number of addresses added to the stack
    li $s7, 0 
    # Mark the nubs to be removed onto the stack
    jal check_horizontal_matches
    jal check_vertical_matches
    # Use the value of s7 to update the intensity of gravity
    jal increase_gravity_intensity
    # Remove them from the PILL_BOTTLE array.
    jal eliminate_matches
    check_matches_stop:
    # Load the return address.
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Check each row of the PILL_BOTTLE for matches and store those
# addresses on the stack.
    # $s7: the number of addresses added to the stack
check_horizontal_matches:
    # Store the return address
    move $s4, $ra
    # Set up the loop variables
    li $s5, 0      # Current column
    li $s6, 0      # Current row

    horizontal_loop:
    # Terminate if past the last row:
    beq $s6, 16, horizontal_loop_end
    # Find the coordinate offset from PILL BOTTLE
    move $a0, $s5
    move $a1, $s6
    jal coordinates_to_pill_bottle
    # Load it into $a0
    move $a0, $v0
    # Load the color at the given position.
    lw $a1, 0($a0)
    # Move one column over if the initial color is black.
    beqz $a1, h_next_col
    # Go through consecutive addresses and check whether
    # they form a row of 4+ of the same color.
    li $a2, 4
    jal color_check
    blt $v0, 4, h_next_row
    # At this point $v0 (4+) consecutive positions hold identical colors
    # so store their addresses on the stack.
    li $a1, 4
    move $a2, $v0
    jal matches_to_stack
    # Then move past the column of consecutive colors (subtr. 1 to 
    # account for the +1 from v_next_row)
    subi $v0, $v0, 1
    add $s5, $s5, $v0
    
    h_next_col:
    addi $s5, $s5, 1
    # Move down a row if less than 4 columns remain
    # NOTE: adding $v0 may push us past 5 columns
    bge $s5, 5, h_next_row
    j horizontal_loop

    h_next_row:
    li $s5, 0
    addi $s6, $s6, 1
    j horizontal_loop
      
    horizontal_loop_end:
    move $ra, $s4
    jr $ra


# Check each column of the PILL_BOTTLE for matches and store those
# addresses on the stack.
check_vertical_matches:
    # Store the return address
    move $s4, $ra
    # Set up the loop variables
    li $s5, 0      # Current colun
    li $s6, 0      # Current row

    vertical_loop:
    # Terminate if past the last column:
    beq $s5, 8, vertical_loop_end
    # Find the address in PILL BOTTLE
    move $a0, $s5
    move $a1, $s6
    jal coordinates_to_pill_bottle
    # Load the address into $a0
    move $a0, $v0
    # Load the color at the given position.
    lw $a1, 0($a0)
    # Move one row over if the initial color is black.
    beqz $a1, v_next_row
    # Go through consecutive addresses and check whether
    # they form a column of 4+ of the same color.
    li $a2, 32
    jal color_check
    blt $v0, 4, v_next_row
    # At this point $v0 consecutive positions hold identical colors
    # so store their addresses on the stack.
    li $a1, 32
    move $a2, $v0
    jal matches_to_stack
    # Then move past the column of consecutive colors (subtr. 1 to 
    # account for the +1 from v_next_row)
    subi $v0, $v0, 1
    add $s6, $s6, $v0
    
    v_next_row:
    addi $s6, $s6, 1
    # move over a column if less than 4 rows remain.
    # NOTE: adding $v0 may push us past 13 rows, check using bge
    bge $s6, 13, v_next_column
    j vertical_loop

    v_next_column:
    li $s6, 0
    addi $s5, $s5, 1
    j vertical_loop
      
    vertical_loop_end:
    move $ra, $s4
    jr $ra

# Compare the colors of the origin and consecutive addresses
# at given offsets. Returns the number of consecutive identical 
# colors (virus color variance agnostic).
  # $a0: contains the initial address to start from.
  # $a1: the initial color to compare.
  # $a2: the offset between addresses to check.
  # $v0: The number of consecutive matches found.
color_check:
    # First find out if the color is a pill or virus color
    la $t0, VIRUS_COLOR_TABLE
    la $t1, CAPSULE_COLOR_TABLE
    
    # Loops until the corresponding virus/pill color is identified.
    color_loop:
    # Load the color at each address
    lw $t2, 0($t0)
    lw $t3, 0($t1)
    # Check whether it matches the color at that position on the game board.
    beq $a1, $t2, handle_color
    beq $a1, $t3, handle_color
    # Otherwise move a word and try again.
    addi $t0, $t0, 4
    addi $t1, $t1, 4
    j color_loop
    
    # Since the values in the color tables are set up 1 to 1, when the loop
    # terminates, t2 and t3 will have the equivalent color shades- no matter 
    # what type of color (virus or pill) $a1 contains.
    handle_color:
    # Set up loop variables
    move $t0, $a0            # Copy the address of the original color to $t0
    li $t1, 0                # Counter for matched blocks
    handle_color_loop:
    # Check whether the color at position $t0 matches a corresponding
    # capsule or virus color.
    lw $t4, 0($t0)
    beq $t4, $t2, color_match
    beq $t4, $t3, color_match
    # At this point, the color at $t0 doesn't match either the virus or
    # capsule color variants of the inital color, so there's no match.
    # Thus we return.
    move $v0, $t1
    jr $ra

    color_match:
    # Increment to the address of the next adjacent cell in the PILL_BOTTLE
    # by the offset in $a2
    add $t0, $t0, $a2
    # Update the match counter
    addi $t1, $t1, 1
    j handle_color_loop
  

# Add $a2 addresses to the stack from PILL_BOTTLE.
  # $a0: contains the initial address to start from.
  # $a1: the offset between addresses (in bytes)
  # $a2: the number of addresses to add.
  # $s7: the total # of words added to the stack.
matches_to_stack:
    # Set up the loop variable
    move $t0, $a0
    li $t1, 0
    
    mts_loop:
    # Check terminal condition
    beq $t1, $a2, mts_loop_end
    # Allocate space on the stack
    addi $sp, $sp, -4
    # Write the address to the stack
    sw $t0, 0($sp)
    # Move over a row/column depending on $a1
    add $t0, $t0, $a1
    # Increment the stack tracking variable
    addi $s7, $s7, 1
    # increment the loop variable
    addi $t1, $t1, 1
    j mts_loop
    
    mts_loop_end:
    jr $ra

# Eliminate the addresses stored on the stack from the PILL_BOTTLE
# array. Update NUB_PARTNERS to reflect orphaned nubs. Call a function
# to update the score.
    # $s7: the number of addresses to retrieve from the stack.
eliminate_matches:
    # Initialize the loop variable
    li $t9, 0
    # Store the values to be written
    # (0 for eliminated nubs, 1 for floating nubs)
    li $t0, 0
    li $t5, 1

    elim_matches_loop:
    beq $t9, $s7, elim_matches_end
    # Grab a value off the stack and increment the pointer
    lw $t1, 0($sp)
    addi $sp, $sp, 4
    # Write 0 to that address on the game board.
    sw $t0, 0($t1)
    # Find the offset (in bytes) of the address 
    # relative to the start of the PILL_BOTTLE array
    la $t2, PILL_BOTTLE
    sub $t3, $t1, $t2
    # Add that offset to the NUB_PARTNERS array to get 
    # the equivalent address.
    la $t2, NUB_PARTNERS
    add $t1, $t2, $t3
    # Check whether that address has already been overwritten.
    # If so, load the next address from the stack.
    lw $t4, 0($t1)
    beq $t4, 0, next_match_cell
    # Check whether that address holds a virus or newly orphaned
    # cell, which have no partners to go to.
    beq $t4, 2, overwrite_cell
    beq $t4, 1, overwrite_cell
    # Otherwise load the address of the partner nub 
    # and set it to 1.
    sw $t5, 0($t4)
    # Then overwrite the original cell in NUB_PARTNERS.
    overwrite_cell:
    sw $t0, 0($t1)
    
    next_match_cell:
    addi $t9, $t9, 1
    j elim_matches_loop
    
    elim_matches_end:
    jr $ra

# Scan NUB_PARTNERS for any orphaned nubs and drop them on gravity 
# ticks.
drop_orphaned_nubs:
    # Load gravity count
    la $t0, GRAVITY_INFO
    lw $t1, 0($t0)      # Gravity count
    # Drop orphans if the count has just been reset to 0.
    beq $t1, 0, drop_orphans
    # Otherwise do nothing.
    jr $ra

    drop_orphans:
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Reset the NUB_TO_DROP_EXISTS flag
    la $t0, NUB_TO_DROP_EXISTS
    # Update the PREV value
    lw $t1, 0($t0)
    sw $t1, 4($t0)
    # Load zero to the CURR value
    sw $zero, 0($t0)
    # Set up the loop variables.
    li $s5, 0      # X position
    li $s6, 14     # Y position
    
    drop_orphans_loop:
    # Check the terminal loop condition
    bltz $s6, drop_orphans_loop_end
    # Load the address of that x,y position
    move $a0, $s5
    move $a1, $s6
    jal coordinates_to_nub_partners
    # Save the address to $t0
    move $t0, $v0
    # Retrieve the value at that position
    lw $t1, 0($t0)
    # If it's not an orphaned nub, (i.e. it's a partnered nub, empty
    # or a virus) move on.
    bne $t1, 1, orphans_move_column
    # Next check if the space beneath the nub is empty. If not,
    # move on.
    addi $a1, $a1, 1
    jal coordinates_to_nub_partners
    lw $t2, 0($v0)
    bne $t2, 0, orphans_move_column
    
    # At this point, we know the current position holds an orphaned nub with space below it,
    # so it can be moved down a row. 
    # First, update the NUB_TO_DROP_EXISTS flag to reflect this.
    li $t1, 1
    sw $t1, NUB_TO_DROP_EXISTS($zero)
    # Then, move the nub down on the PILL_BOTTLE game board.
    move $a0, $s5
    move $a1, $s6
    jal coordinates_to_pill_bottle
    # Store whatever color is at that position then write black to it.
    lw $s4, 0($v0)
    li $t0, 0
    sw $t0, 0($v0)
    # Then move down a row and write the stored color there.
    addi $a1, $a1, 1
    jal coordinates_to_pill_bottle
    sw $s4, 0($v0)
    # Next do practically the same thing for the NUB_PARTNERS array.
    # (write 0 to the current position)
    move $a0, $s5
    move $a1, $s6
    jal coordinates_to_nub_partners
    li $t0, 0
    sw $t0, 0($v0)
    # (move down a row and write 1 there)
    addi $a1, $a1, 1
    jal coordinates_to_nub_partners
    li $t0, 1
    sw $t0, 0($v0)
    # Then move over a column/ row

    orphans_move_column:
    addi $s5, $s5, 1
    # If we've reached the end of a row, move up a column
    beq $s5, 8, orphans_move_row
    # Otherwise go to the start of the loop
    j drop_orphans_loop

    orphans_move_row:
    li $s5, 0
    addi $s6, $s6, -1
    j drop_orphans_loop

    drop_orphans_loop_end:
    # Retrieve the return address.
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    
##############################################################################
# COLLISION CHECKING FUNCTIONS
##############################################################################

# Check whether the move stored in NEW_PILL is valid given the sides of the game board.
# If not, revert the move.
    # $s2: The address of the NEW_PILL.
check_wall_collisions:
    # Load the left wall index
    la $t0, EDGE_BOUNDS
    lw $t1, 0($t0)
    # Check whether nub 1 breaches the left wall.
    lw $t2, 0($s2)          # Nub 1 X coord.
    bltz $t2, revert_wall_collision
    # Check whether nub 2 breaches the right wall.
    lw $t2, 12($s2)          # Nub 2 X coord.
    bge $t2, $t1, revert_wall_collision
    jr $ra

    revert_wall_collision:
    la $a0, CURR_PILL
    la $a1, NEW_PILL
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal copy_pill_args
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    
# If the capsule was moved, check whether or not the 
# move is valid given the state of the game board.
# If not, revert the move.
    # $s2: The address of NEW_PILL.
    # $s3: The address of CURR_PILL.
check_gameboard_collisions:
    # Store the return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Check whether the positions of both nubs are identical accross CURR and NEW.
    jal check_pills_unique
    # If not, exaine the move
    beq $v0, 1, examine_move
        
    examine_move:
    # Set up the loop variables
    li $t9, 0
    la $t8, NEW_PILL
    examine_start:
    # Check the loop condition:
    beq $t9, 2, examine_end
    # Load the coordinates of the nub's new position.
    lw $a0, 0($t8)   # nub X-coord.
    lw $a1, 4($t8)   # nub Y-coord.
    # Calculate the offset from the pill bottle
    jal coordinates_to_pill_bottle
    # If that index is occupied (non-zero), revert the move.
    lw $t0, 0($v0)
    bgtz $t0, revert_move
    # Otherwise increment the loop variables and repeat
    addi $t9, $t9, 1
    addi $t8, $t8, 12
    j examine_start
    
    examine_end:
    # Return if neither nub position is occupied.
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    
    revert_move:
    la $a0, CURR_PILL
    la $a1, NEW_PILL
    jal copy_pill_args
    # Load the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    
# Check whether or not the capsule (in its new position) has clipped into the bottle floor.
# If so, revert its position.
    # $s2: The address of NEW_PILL.
    # $s3: The address of CURR_PILL.
check_floor_collisions:
    # Check whether or not the capsule has hit the floor.
    la $t0, EDGE_BOUNDS
    lw $t1, 4($t0)                      # Load the y coordinate of the floor into $t1.
    lw $t2, 4($s2)                      # Load the y coordinate of nub 1 into $t2.
    # Raise the flag if the position is at or below the floor.
    ble $t1, $t2, revert_underside_collision
    # Otherwise do nothing
    jr $ra
    
    revert_underside_collision:
    # store the return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Revert the move
    la $a0, CURR_PILL
    la $a1, NEW_PILL
    jal copy_pill_args
    # Load the return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    
# Lock the pill's position on gravity ticks when it's at floor level or above a virus/other pill.
    # $s2: The address of NEW_PILL.
    # $s3: The address of CURR_PILL.
lock_pill_position:
    # Save the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Check whether the pill's position has been locked.
    lw $t0, PILL_LOCK
    beq $t0, 1, lock_pill_end
    # Do nothing if the gravity hasn't been reset
    la $t0, GRAVITY_INFO
    lw $t1, 0($t0)
    bne $t1, 0, lock_pill_end
    
    # Check whether or not the capsule has hit the floor.
    la $t0, EDGE_BOUNDS
    lw $t1, 4($t0)                      # Load the y coordinate of the floor into $t1.
    addi $t1, $t1, -1                   # Use the floor "boundary" instead
    lw $t2, 4($s2)                      # Load the y coordinate of nub 1 into $t2
    # If not, check whether something else is below them
    bne $t1, $t2, check_nub_1
    # Also, delay the lock to ensure a soft landing (ticks that allow the capsule to be moved).
    la $t0, PILL_LOCK_TIMER
    lw $t1, 0($t0)
    addi $t1, $t1, 1
    sw $t1, 0($t0)
    li $t2, 2
    blt $t1, $t2, lock_pill_end
    j set_pill_lock
    
    # Check whether or not the capsule has hit another capsule or a virus.
    # First check whether the space below nub 1 is occupied.
    check_nub_1:
    lw $a0, 0($s3)      # nub 1 X-coord.
    lw $a1, 4($s3)      # nub 1 Y-coord.
    addi $a1, $a1, 1    # move down a row    
    # Calculate the offset from the pill bottle
    jal coordinates_to_pill_bottle
    # Check whether or not that location is occupied. If so, stop moving.
    lw $t0, 0($v0)
    bgtz $t0, set_pill_lock
    # If not, and the capsule is horizontal, check whether the space below nub 2 is occupied.
    lw $t0, 24($s2)
    beq $t0, 0, check_nub_2
    # If the capsule isn't horizontal; return
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    
    # Now check if the space below nub 2 is occupied.
    check_nub_2:
    lw $a0, 12($s3)      # nub 2 X-coord.
    lw $a1, 16($s3)      # nub 2 Y-coord.
    addi $a1, $a1, 1     # Move down a row    
    la $a2, PILL_BOTTLE
    # Calculate the offset from the pill bottle
    jal coordinates_to_pill_bottle
    # Check whether or not that location is occupied. If so, stop moving.
    lw $t3, 0($v0)
    bgtz $t3, set_pill_lock
    # Otherwise return
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    
    set_pill_lock:
    # Set the pill lock flag high.
    la, $t0, PILL_LOCK
    li $t1, 1
    sw $t1, 0($t0)
    # Write the pill to the NUB_PARTNERS array.
    jal add_pill_to_nub_partners
    # Reset the PILL_LOCK_TIMER
    la $t0, PILL_LOCK_TIMER
    li $t1, 0
    sw $t1, 0($t0)
    # Set up the loop variables
    la $t8, NEW_PILL
    li $t9, 0
    # Write the pill position to the game area.
    save_pill_loop:
    # Find the offset of the pill relative to PILL_BOTTLE.
    beq $t9, 2, lock_pill_end
    lw $a0, 0($t8)
    lw $a1, 4($t8)
    jal coordinates_to_pill_bottle
    # Write the nub color to the offset.
    lw $t0, 8($t8)
    sw $t0, 0($v0)
    # Increment the loop variable and nub.
    addi $t8, $t8, 12
    addi $t9, $t9, 1
    j save_pill_loop
    
    lock_pill_end:
    # Then return.
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

##############################################################################
# CAPSULE MOVING FUNCTIONS
##############################################################################

# Deterines whether a move is warranted based on the pressed key as well as the current and prev keyboard state.
# Only executes key-specific instructions if 1) a rising edge has occurred and the key is W,A,D or 2) the current
# keyboard state is high and S is pressed. Also updates the previous keyboard state.
    # $a0: CURR_KBRD_STATE
    # $a1: The value of the key pressed.
    # Return behavior: either jumps back to the function call if conditions 1 or 2 are met, 
    #                   else jumps straight to check_collisions.
check_want_to_move:
    # Load the previous keyboard state to $t1.
    la $t0, KBRD_PREV_STATE
    lw $t1, 0($t0)
    
    check_condition_1:
    # Check whether there's been a rising edge.
    xori $t1, $t1, 1
    and $t2, $t1, $a0
    # If there hasn't been a rising edge, check condition two.
    beqz $t2, check_condition_2
    # Next check whether W, A, or D were pressed.
    beq $a1, 0x77, want_to_move
    beq $a1, 0x61, want_to_move
    beq $a1, 0x64, want_to_move
    # If not, check condition two.
    j check_condition_2
    
    check_condition_2:
    # Check that both S was pressed and CURR_KBRD_STATE is high.
    li $t1, 0x73
    seq $t2, $a1, $t1           # Sets $t2 to 1 if a1 and t1 are equal.
    and $t2, $t2, $a0
    beq $t2, 1, want_to_move
    # Condition not met- update KBRD_PREV_STATE and jump to checking collisions.
    sw $a0, 0($t0)
    j check_collisions
    
    want_to_move:
    # Update KBRD_PREV_STATE before returning
    sw $a0, 0($t0)
    jr $ra

# Rotate the capsule in NEW_PILL in response to the W key.
# Precondition: NEW_PILL is a copy of CURR_PILL.
    # s2: # The address of the NEW_PILL.
rotate_capsule:
    # Branch according to the pill's current orientation.
    lw $t0, 24($s2)
    beq $t0, 1, rotate_vertical_pill
    
    rotate_horizontal_pill:
    # Shift the right nub to the "top" position.
    lw $t0, 12($s2)     # Nub 2 X-coord.
    sub $t0, $t0, 1     # move the nub 1 to the left
    sw $t0, 12($s2)      
    lw $t1, 16($s2)     # Nub 2 Y-coord
    sub $t1, $t1, 1     # move the nub up one row
    sw $t1, 16($s2)
    # Update the pill orientation.
    li $t2, 1
    sw $t2, 24($s2)
    # Return
    j check_collisions
    
    rotate_vertical_pill:
    # Save the color value of nub 1.
    lw $t0, 8($s2)
    # Write the color value of the top nub into the bottom nub.
    lw $t1, 20($s2)
    sw $t1, 8($s2)
    # move nub 2 into its right position
    lw $t1, 12($s2)     # $t1 = Nub 2 X-coord.
    addi $t1, $t1, 1    # ove the nub 1 to the right
    sw $t1, 12($s2)      
    lw $t2, 16($s2)     # $t2 = Nub 2 Y-coord.
    addi $t2, $t2, 1    # ove the nub up down row
    sw $t2, 16($s2)
    # Write the (old) color value of nub 1 into nub 2.
    sw $t0, 20($s2)
    # Update the pill orientation.
    li $t3, 0
    sw $t3, 24($s2)
    # Return
    j check_collisions

# Move NEW_PILL left in response to the A key.
# Precondition: NEW_PILL is a copy of CURR_PILL.
    # s2: # The address of the NEW_PILL.
move_capsule_left:
    # Shift nub 1 left by 1.
    lw $t0, 0($s2)      # X-coord nub 1
    sub $t0, $t0, 1     # move the nub to the left
    sw $t0, 0($s2)
    # Shift nub 2 left by 1.
    lw $t1, 12($s2)     # X-coord nub 2
    sub $t1, $t1, 1     # move the nub to the left
    sw $t1, 12($s2)
    # Return
    j check_collisions

# Move the NEW_PILL right in response to the D key.
# Precondition: NEW_PILL is a copy of CURR_PILL.
    # s2: # The address of the NEW_PILL.
move_capsule_right:
    # Shift nub 1 right by 1.
    lw $t0, 0($s2)      # X-coord nub 1
    addi $t0, $t0, 1     # move the nub to the right
    sw $t0, 0($s2)
    # Shift nub 2 left by 1.
    lw $t1, 12($s2)     # X-coord nub 2
    addi $t1, $t1, 1     # move the nub to the left
    sw $t1, 12($s2)
    # Return
    j check_collisions

# Move the NEW_PILL down in response to the S key.
# Precondition: NEW_PILL is a copy of CURR_PILL.
    # s2: # The address of the NEW_PILL.
drop_capsule_down:
    # Shift nub 1 down by a row.
    lw $t0, 4($s2)      # Y-coord nub 1
    addi $t0, $t0, 1     # Move the nub down a row
    sw $t0, 4($s2)
    # Shift nub 2 down by a row.
    lw $t1, 16($s2)     # Y-coord nub 2
    addi $t1, $t1, 1     # Move the nub down a row
    sw $t1, 16($s2)
    # Return
    j check_collisions

# Move the pill down a row once the count paraeter of GRAVITY_INFO
# reaches the value specified by the intensity.
    # s2: # The address of the NEW_PILL.
check_gravity:
    # Load gravity count/intensity
    la $t0, GRAVITY_INFO
    lw $t1, 0($t0)      # Gravity count
    lw $t2, 4($t0)      # Gravity intensity.
    # Increment gravity count
    addi $t1, $t1, 1
    sw $t1, 0($t0)
    # Branch if the count equals the intensity
    beq $t1, $t2, apply_gravity
    # Otherwise do nothing.
    jr $ra
    
    apply_gravity:
    # Reset the gravity count
    li $t1, 0
    sw $t1, 0($t0)
    # Shift nub 1 down by a row.
    lw $t0, 4($s2)      # Y-coord nub 1
    addi $t0, $t0, 1    # move the nub down
    sw $t0, 4($s2)
    # Shift nub 2 down by a row.
    lw $t1, 16($s2)     # Y-coord nub 2
    addi $t1, $t1, 1    # move the nub down
    sw $t1, 16($s2)
    # Return
    jr $ra

##############################################################################
# SPAWNING FUNCTIONS
#############################################################################

# Spawn viruses (in increents of 4) at random locations on the pill bottle array.
    # $a0: the scalar for how many viruses to load.
spawn_viruses:
    # Store the value of $ra on the stack.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Calculate the # of viruses to spawn and set up the loop variable.
    sll $t8, $a0, 2
    li $t9, 0
    spawn_start:
    # Check whether the appropriate # of viruses have been spawned,
    # and terminate the loop if so.
    beq $t8, $t9, spawn_end
    # Generate a random virus color.
    li $v0, 42
    li $a0, 0
    li $a1, 3                   
    syscall
    # Look up the color's value and store it in $s7.
    la $t0, VIRUS_COLOR_TABLE         
    sll $t1, $a0, 2
    add $t0, $t1, $t0
    lw $s7, 0($t0)
    # Generate a row index fro 8 to 15 into $t1.
    li $a0, 0
    li $a1, 9
    syscall
    addi $a0, $a0, 7
    move $t1, $a0
    # Generate a column index from 0 to 7 into $a0.
    li $a0, 0
    li $a1, 8                   
    syscall
    # Calculate the offset of the coordinates relative to the PILL_BOTTLE array
    move $a1, $t1
    jal coordinates_to_pill_bottle
    # Check if the array location is occupied (if there's alread a virus there). 
    # If so, generate new coordinates and try again.
    lw $t2, 0($v0)
    bne $t2, 0, spawn_start
    # Otherwise, write the chosen color value to the appropriate array position.
    sw $s7, 0($v0)
    # Then find the offset relative to the NUB_PARTNERS array and mark it there.
    jal coordinates_to_nub_partners
    li $t0, 2
    sw $t0, 0($v0)
    # then increment the loop variable and return.
    addi $t9, $t9, 1
    j spawn_start

    spawn_end:
    lw $ra, 0($sp)          # Retrieve the original value of $ra and return.
    addi $sp, $sp, 4
    jr $ra


# Write a new pill to NEW_PILL and store the partner
# addresses in NUB_PARTNERS (on gravity ticks if the current pill is locked
# and no nub to drop exists).
spawn_pill:
    # Check whether gravity was just reset. If not, do nothing.
    lw $t0, GRAVITY_INFO
    bne $t0, 0, spawn_pill_end
    # Then, check that the current pill position is locked and 
    # no nubs have been dropped.
    lw $t0, PILL_LOCK
    lw $t1, NUB_TO_DROP_EXISTS
    xori $t1, $t1, 1
    and $t2, $t0, $t1
    bne $t2, 1, spawn_pill_end
    # Otherwise, proceed.
    
    # Set up the loop variables
    la $t8, NEW_PILL    # Pill structure position
    li $t9, 0           # Incrementee
    # Reset the pill orientation flag.
    li $t0, 0
    sw $t0, 24($t8)
    # Unlock the pill movement.
    la, $t0, PILL_LOCK
    li $t1, 0
    sw $t1, 0($t0)
    # Load the position of the 1st nub
    li $t0, 3           # Nub 1 initial x coordinate (relative to the game area).
    li $t1, 0           # Nub 1 initial y coordinate (relative to gae area).
    # Loop twice (once for each nub)
    spawn_pill_start:
    beq $t9, 2, spawn_pill_end
    # Save the position of the nub
    add $t0, $t0, $t9       # Shifts the x coordinate 1 right during the second loop.
    sw $t0, 0($t8)
    addi $t8, $t8, 4
    sw $t1, 0($t8)
    addi $t8, $t8, 4
    # Generate a nub color into $a0
    li $v0, 42
    li $a0, 0
    li $a1, 3
    syscall
    # Look up the color's value and store it in NEW_PILL
    la $t2, CAPSULE_COLOR_TABLE
    sll $t3, $a0, 2             # Find the offset of the color
    add $t2, $t2, $t3           # relative to the table
    lw $t3, 0($t2)
    sw $t3, 0($t8)
    addi $t8, $t8, 4
    # Increment the loop variable and check loop condition.
    addi $t9, $t9, 1
    j spawn_pill_start
    
    spawn_pill_end:
    # Return to the calling point
    jr $ra

##############################################################################
# DRAWING FUNCTIONS
##############################################################################

# Draws the score to the screen. Assumes the score won't surpass 6 digits.
    # $a0: the address of the digit offset table to use.
draw_score:
    # Save the return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Set up important variables to store betw. calls to draw_shape
    li $t5, 0            # Address of the current digit's offset
    li $t6, 0            # Address of the current digit's sprite
    move $t7, $a0        # Address of the offset table
    lw $t8, SCORE        # Score variable (divided)
    li $t9, 0            # Loop index
    
    draw_digit_loop:
    # Check terminal loop condition
    beq $t9, 6, draw_digit_end
    # Isolate the digit
    li $t0, 10
    div $t8, $t0
    mfhi $t1             # Extracted digit (mod)
    mflo $t8             # Remaining digits (quotient)
    # Retrieve the address of the digit's offset
    sll $t2, $t9, 3      # Word offset in the table
    add $t5, $t7, $t2    # Address of the digit offset
    # Calculate the address of the digit's sprite
    la $t0, DIGIT_JUMP_TABLE
    sll $t2, $t1, 2
    add $t3, $t0, $t2
    lw $t6, 0($t3)
    # Store the loop variables on the stack
    push ($t6)
    push ($t7)
    push ($t8)
    push ($t9)
    # Draw black to the digit's position (prevent overlaps)
    move $a0, $t5
    la $a1, NULL_DIGIT
    li $a2, 0x0
    jal draw_shape
    # Restore the temp registers
    pop ($t9)
    pop ($t8)
    pop ($t7)
    pop ($t6)
    # Load the new digit arguments
    move $a0, $t5
    move $a1, $t6
    li $a2, 0xffffff
    # Store the temp reg values on the stack
    push ($t6)
    push ($t7)
    push ($t8)
    push ($t9)
    # Draw the digit
    jal draw_shape
    # Restore the temp reg values.
    pop ($t9)
    pop ($t8)
    pop ($t7)
    pop ($t6)
    # Move to the next digit and draw again
    addi $t9, $t9, 1
    j draw_digit_loop
    
    draw_digit_end:
    # Return to the calling point
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    
# Draw the data in NEW_PILL to the screen if the pill is unlocked.
draw_pill:
    # Store the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Check whether the current pill position is locked.
    lw $t0, PILL_LOCK
    beq $t0, 1, draw_pill_end
    # Load the game area offsets
    la $t0, GAME_AREA_OFFSETS
    lw $s6, 0($t0)              # X coord. of game area offset.
    lw $s7, 4($t0)              # y coord. of game area offset.
    # Set up the loop and address variable
    li $t9, 0
    la $t8, NEW_PILL
    # Loop twice (once for each nub)
    draw_pill_start:
    beq $t9, 2, draw_pill_end
    # Load the coordinates of the nub
    lw $t1, 0($t8)
    lw $t2, 4($t8)
    # Add the offsets and move the to the arguent registers.
    add $a0, $t1, $s6
    add $a1, $t2, $s7
    # Call coordinates to offset relative to the display.
    move $a2, $s0
    jal coordinates_to_offset
    # Read the nub color and write it at the given offset.
    lw $t0, 8($t8)
    sw $t0, 0($v0)
    # Increment the loop variable/address to the next nub.
    addi $t8, $t8, 12
    addi $t9, $t9, 1
    j draw_pill_start
    
    draw_pill_end:
    # Return to the calling point
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Draw the data in PILL_BOTTLE to the screen.
draw_game_board:
    # Store the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    # Find the screen-relative offset of the first pixel on the board.
    la $t0, GAME_AREA_OFFSETS
    lw $a0, 0($t0)
    lw $a1, 4($t0)
    jal coordinates_to_offset
    # Set up the loop variables
    li $t7, 0   # Row index
    li $t8, 0   # Overall index
    li $t9, 128
    la $t0, PILL_BOTTLE
    draw_board_loop:
    beq $t8, $t9, draw_board_end
    # Write the value from PILL_BOTTLE to the display
    lw $t1, 0($t0)
    sw $t1, 0($v0)
    # Move to the next pixel
    addi $t0, $t0, 4
    addi $v0, $v0, 4
    # Increment the loop variables
    addi $t8, $t8, 1
    addi $t7, $t7, 1
    # Jmup down a row on the display if a row has been written
    beq $t7, 8, move_down_row
    j draw_board_loop
    
    move_down_row:
    addi $v0, $v0, 96
    li $t7, 0
    j draw_board_loop
    
    draw_board_end:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Draw the given object to the game board at the given offset.
  # a0: the address of the offset object from which to take
  #     the item's offsets
  # a1: the address of the line object
  # a2: the color to draw the object with.
draw_shape:
    # Save the value of $ra.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Load the shape offsets
    lw $s6, 0($a0)                  # X offset
    lw $s7, 4($a0)                  # Y offset
    # Load the shape's color
    move $a3, $a2
    # Move the address of the lines table
    move $s5, $a1
    
    draw_shape_loop:
    lw $t1, 0($s5)              # Load x
    bltz $t1, shape_end         # If x is -1, end of table
    lw $t2, 4($s5)              # Load y
    lw $t3, 8($s5)              # Load line length
    lw $t4, 12($s5)             # Load line type
    # Apply the stored offsets
    add $a0, $t1, $s6           # X coordinate
    add $a1, $t2, $s7           # Y coordinate
    move $a2, $t3               # Line length
    # Branch according to the line type.
    addi $sp, $sp, -4
    beq $t4, $zero, draw_horizontal
    # Draw a vertical Line
    li $t0, 128
    sw $t0, 0($sp)
    jal draw_line
    j draw_shape_next
    
    draw_horizontal:
    # Draw a horizontal line
    li $t0, 4
    sw $t0, 0($sp)
    jal draw_line
        
    draw_shape_next:
    addi $s5, $s5, 16       # ove to the next entry (4 words * 4 bytes)
    j draw_shape_loop
        
    shape_end:
    # Retrieve the value of $ra.
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Draw a line
    # $a0: The x coordinate of the leftmost line segent.
    # $a1: the y coordinate of leftmost line segent.
    # $a2: the line length
    # $a3: the color to draw
    # $sp: the offset between pixels.
draw_line:
    # Retrieve the pixel offset from the stack
    lw $s4, 0($sp)
    # Store the value of $ra on the stack.
    sw $ra, 0($sp)
    # Calculate the offset of the first pixel into $v0.
    jal coordinates_to_offset
    # Initialize the loop variable.
    li $t9, 0
    
    draw_line_start:
    beq $a2, $t9, draw_line_end
    sw $a3, 0($v0)           # Draw color $a3 at $v0
    add $v0, $v0, $s4        # Move according to the offset.
    addi $t9, $t9, 1         # Increment the loop variable
    j draw_line_start
        
    draw_line_end:
    # Retrieve the value of $ra.
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

##############################################################################
# COORDINATE TO OFFSET FUNCTIONS
##############################################################################

# Convert a set of x,y coordinates to an offset relative to the display address.
    # $a0: The x coordinate.
    # $a1: the y coordinate.
    # $v0: the resulting position.
coordinates_to_offset:
    sll $t0, $a0, 2         # x * 4 : the x-coordinate offset
    sll $t1, $a1, 7         # y * 128 : the y-coordinate offset
    add $t2, $t0, $t1       # The offset of the first pixel.
    add $v0, $t2, $s0       # The position of the first pixel.
    jr $ra
    
# Convert a set of x,y coordinates to an offset relative to the game board address.
    # $a0: The x coordinate.
    # $a1: the y coordinate.
    # $v0: the resulting position.
coordinates_to_pill_bottle:
    la $t0, PILL_BOTTLE
    sll $t1, $a0, 2         # x * 4 : the x-coordinate offset
    sll $t2, $a1, 5         # y * 5 : the y-coordinate offset
    add $t3, $t1, $t2       # The offset of the first pixel.
    add $v0, $t3, $t0       # The position of the first pixel.
    jr $ra

  # Convert a set of x,y coordinates to an offset relative to the nub_partners array.
    # $a0: The x coordinate.
    # $a1: the y coordinate.
    # $v0: the resulting position.
coordinates_to_nub_partners:
    la $t0, NUB_PARTNERS
    sll $t1, $a0, 2         # x * 4 : the x-coordinate offset
    sll $t2, $a1, 5         # y * 5 : the y-coordinate offset
    add $t3, $t1, $t2       # The offset of the first pixel.
    add $v0, $t3, $t0       # The position of the first pixel.
    jr $ra

##############################################################################
# MISCELLANEOUS FUNCTIONS
##############################################################################

# Calls the system to quit if Q is pressed.
quit_game:
  	li $v0, 10                      # Quit gracefully
	syscall

# Copy the PILL data fro the address $a0 to the address $a1.
    # $a0 = src address
    # $a1 = dst address
copy_pill_args:
    # Initialize the loop variables.
    li   $t8, 7      # number of words per PILL
    li   $t9, 0      # loop counter
    
    copy_pill_loop:
    # Check whether the end of the loop was reached.
    beq  $t8, $t9, copy_pill_stop
    # Copy the data at the given position fro $a0 to $a1.
    lw   $t4, 0($a0)
    sw   $t4, 0($a1)
    # move over 1 word in both PILLs.
    addi $a0, $a0, 4
    addi $a1, $a1, 4
    # Increment the loop variable and return.
    addi $t9, $t9, 1
    j copy_pill_loop
    
    copy_pill_stop:
    jr $ra

# Checks whether the pill positions in CURR_PILL and NEW_PILL
# have been modified. Returns 1 if so and 0 otherwise.
  # $v0: 1 iff the coordinates in CURR and NEW are different.
check_pills_unique:
    # Set up loop variables:
    la $t7, NEW_PILL
    la $t8, CURR_PILL
    li $t9, 0
    # Initialize the return value
    li $v0, 1
    
    check_nub_start:
    # Check the loop condition:
    beq $t9, 2, check_nub_end
    # Copare the X coordinates
    lw $t0, 0($t7)     # NEW_PILL X-coordinate
    lw $t1, 0($t8)     # CURR_PILL X-coordinate
    seq $t2, $t0, $t1
    # Compare the y coordinates
    lw $t3, 4($t7)     # CURR_PILL Y-coordinate 
    lw $t4, 4($t8)     # CURR_PILL Y-coordinate
    seq $t5, $t3, $t4
    # If the pill was moved, $t6 will be 0.
    and $t6, $t2, $t5 
    # If $t6 is ever 0, $v0 sets to 0.
    and $v0, $v0, $t6
    # Otherwise increment the loop variables and return.
    addi $t7, $t7, 12
    addi $t8, $t8, 12
    addi $t9, $t9, 1
    j check_nub_start
    
    check_nub_end:
    jr $ra

# Given the pill inforation in NEW_PILL, stores the address
# of each nub at the address of the other on the NUB_PARTNERS array.
add_pill_to_nub_partners:
    # Store the return address.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    # Calculate the NUB_PARTNERS address of the first nub 
    lw $a0, 0($s2)
    lw $a1, 4($s2)
    jal coordinates_to_nub_partners
    move $s4, $v0
    # Calculate the NUB_PARTNERS address of the second NUB_PARTNERS
    lw $a0, 12($s2)
    lw $a1, 16($s2)
    jal coordinates_to_nub_partners
    move $t0, $v0
    move $t1, $v0
    # Load each one's address into the other's.
    sw $s4, 0($t0)
    sw $t1, 0($s4)
    # Return
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# Increase the gravity intensity by 1 tick for every 8 nubs/viruses eliminated, 
# up to a maximum of 10 ticks per second.
    # $s7: the number of pill nubs to eliminate this turn.
increase_gravity_intensity:
    la $t0, GRAVITY_INFO
    lw $t1, 4($t0)       # The current intensity 
    beq $t1, 10, igi_end # If it's already at its fastest, don't do anything.
    lw $t2, 8($t0)       # The current progress towards increasing the intensity
    add $t2, $t2, $s7    # Tack on the # of nubs/viruses eliminated this turn.
    # If there haven't been 8 or more nubs/viruses eliminated yet, do nothing.
    blt $t2, 8, igi_end
    # If there have been 8 or more nubs/viruses eliminated, up the intensity.
    sub $t1, $t1, 1
    sw $t1, 4($t0)
    # Then reset the gravity intensity counter.
    li $t2, 0
    igi_end:
    # Save the value of $t2 to memory
    sw $t2, 8($t0)
    # Then return
    jr $ra
