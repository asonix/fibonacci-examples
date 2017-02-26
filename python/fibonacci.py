#!/usr/bin/env python

def fibonacci():
    # Create initial values of Fibonacci Sequence
    values = [0, 1]

    # Initialize iterator to zero. iterator is used to
    # alternate between the 0 and 1 indexes of values
    # based on whether it is even or odd
    iterator = 0

    while True:
        # yield allows us to give a value to the calling function
        # without explicitly returning. This allows the function to
        # continue where it left off when it is re-accessed
        #
        # The % (modulus) operator is used to get the remainder from
        # division. The remainder of any number divided by two is
        # either 0 or 1.
        yield values[iterator % 2]

        # Replace the number we just used with the sum of the two
        # numbers in values.
        values[iterator % 2] = values[0] + values[1]

        # increment iterator in order to get different index on
        # next iteration
        iterator += 1
