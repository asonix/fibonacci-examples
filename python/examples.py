#!/usr/bin/env python

from fibonacci import fibonacci
from itertools import islice


def main():
    """Run examples for the fibonacci generator"""
    # Make a new fibonacci generator
    f = fibonacci()

    # Get the first five values from the generator
    print("First five values of the fibonacci sequence")
    print(list(islice(f, 5)))
    print()

    # Get the next five values from the generator
    print("Next five values of the fibonacci sequence")
    print(list(islice(f, 5)))
    print()

    # Recreate generator to start at beginning again
    f = fibonacci()

    # Multiply sequence by 5
    # This is computed "lazily." This means that the multiplication
    # will only occur when a value is requested from the generator
    m = map(lambda x: x * 5, f)

    print("Get first five values multiplied by 5")
    print(list(islice(m, 5)))
    print()

    print("Get the next five values multiplied by 5")
    print(list(islice(m, 5)))
    print()


    # Make sequence of only even numbers
    # This also occurs lazily
    f = filter(lambda x: x % 2 == 0, fibonacci())

    print("Get first five even values")
    print(list(islice(f, 5)))
    print()


if __name__ == "__main__":
    main()
