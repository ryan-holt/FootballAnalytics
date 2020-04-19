"""
Contains helper functions for model classes.
"""

# Validates if an argument is an integer.
# This function is used to validate if the permission level is an integer.
def is_int():
    def validate(s):
        try:
            if int(s):
                return s
        except ValueError as e:
            raise ValueError("new_permission_level must be an integer")

    return validate

# Validates if a string is less than a specified maximum length
def max_length(max_len):
    def validate(s):
        if len(s) <= max_len:
            return s
        raise ValueError("String must be at most %i characters long" % max_len)

    return validate
