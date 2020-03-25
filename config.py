class Config(object):
    SQLALCHEMY_DATABASE_URI = 'mysql://root:root@localhost/restfulexample'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    BUNDLE_ERRORS = True
    SECRET_KEY = "3j4k5h43kj5hj234b5jh34bk25b5k234j5bk2j3b532"
    RESTPLUS_VALIDATE = True
    RESTPLUS_MASK_SWAGGER = False
    DEBUG = True

