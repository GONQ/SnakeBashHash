#!/usr/bin/env bash

# bash the snake accumulator hash (demo)
# by GONQ (https://github.com/gonq)

# hashes all files in a folder and its child directories and creates a sum hash of all files
# requires bash and python2.7+ or python3

# this is not for production ... bash/python too slow ... model this to a compiled language for production grade

# choose your poison ... only one of these snake options should be enabled, comment the other ones out

    # snake="python"
    # snake="python2.7"
    snake="python3"

            # modulus is a constant
            modulus=$($snake -c "print( ((1033 * 2201 * 3301 * 4401 * 5501 * 6601 * 7701 * 8801 * 9901) - 1 ) ** 2 )")

            # pad is initial value of modular product chain
            pad=$($snake -c "print( (1101 * 2202 * 3303 * 4404 * 5505 * 6606 * 7707 * 8808 * 9909) - 1)")



            for each in $(find . -type f) # main loop through all files of type file
            do

                shahash=$(sha512sum "$each" | cut -d " " -f1)

                inthash=$($snake -c "print( int('"$shahash"', 16) )")

                # uncomment these to output values from each file
                # echo $shahash
                # echo $inthash

                pad=$($snake -c "print( int('"$inthash"') * int('"$pad"') ) ")

                pad=$($snake -c "print( int('"$pad"') % int('"$modulus"') ) ")

            done # main loop


    # whiten by expansion
    pad=$($snake -c "print( int('"$pad"') ** 16 ) ")

    # whiten by truncation
    hexpad=$( $snake -c "print( hex("$pad").strip('L')[20:84] ) " )

# choose output with or without line break

echo $hexpad
# printf $hexpad
