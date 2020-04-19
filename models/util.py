"""
Contains helper functions for model classes.
"""

# Checks if the permission level is an integer
def is_int():
    def validate(s):
        try:
            if int(s):
                return s
        except ValueError as e:
            raise ValueError("new_permission_level must be an integer")

    return validate

# Check if a string is a certain characters long
def max_length(max_len):
    def validate(s):
        if len(s) <= max_len:
            return s
        raise ValueError("String must be at most %i characters long" % max_len)

    return validate
