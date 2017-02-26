#!/usr/bin/env ruby

##
# Create a module to contain the Fibonacci function

module Fibonacci

    ##
    # Create a new enumerator for the Fibonacci Sequence

    def self.fibonacci
        Enumerator.new do |each_number|
            # Set first two values in fibonacci sequence
            values = [0, 1]

            # Initialize iterator to zero. iterator is used to
            # alternate between the 0 and 1 indexes of values
            # based on whether it is even or odd
            iterator = 0

            loop do
                # The `<<` operator is used to store a new value into the
                # Enumerator. Each time a value is requested from the
                # Enumerator, this loop resumes for one iteration to put
                # a new value.
                #
                # The % (modulus) operator is used to get the remainder from
                # division. The remainder of any number divided by two is
                # either 0 or 1.
                each_number << values[iterator % 2]

                # Replace the number we just used with the sum of the two
                # numbers in values.
                values[iterator % 2] = values[0] + values[1]

                # increment iterator in order to get different index on
                # next iteration
                iterator += 1
            end
        end
    end
end
